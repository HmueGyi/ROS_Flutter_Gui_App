import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ros_flutter_gui_app/basic/diagnostic_array.dart';
import 'package:ros_flutter_gui_app/basic/diagnostic_status.dart';

class DiagnosticState {
  int level;
  String message;
  Map<String, String> keyValues;
  DateTime lastUpdateTime;

  DiagnosticState({
    required this.level,
    required this.message,
    Map<String, String>? keyValues,
    DateTime? lastUpdateTime,
  }) : keyValues = keyValues ?? {},
       lastUpdateTime = lastUpdateTime ?? DateTime.now();

  factory DiagnosticState.fromDiagnosticStatus(DiagnosticStatus status) {
    Map<String, String> kvMap = {};
    for (var kv in status.values) {
      kvMap[kv.key] = kv.value;
    }
    
    return DiagnosticState(
      level: status.level,
      message: status.message,
      keyValues: kvMap,
    );
  }

  DiagnosticState copyWith({
    int? level,
    String? message,
    Map<String, String>? keyValues,
    DateTime? lastUpdateTime,
  }) {
    return DiagnosticState(
      level: level ?? this.level,
      message: message ?? this.message,
      keyValues: keyValues ?? Map.from(this.keyValues),
      lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
    );
  }

  String get levelDisplayName {
    switch (level) {
      case DiagnosticStatus.OK:
        return 'Normal';
      case DiagnosticStatus.WARN:
        return 'Warning';
      case DiagnosticStatus.ERROR:
        return 'Error';
      case DiagnosticStatus.STALE:
        return 'Stale';
      default:
        return 'Unknown';
    }
  }

  Color get levelColor {
    switch (level) {
      case DiagnosticStatus.OK:
        return const Color(0xFF4CAF50);
      case DiagnosticStatus.WARN:
        return const Color(0xFFFF9800);
      case DiagnosticStatus.ERROR:
        return const Color(0xFFF44336);
      case DiagnosticStatus.STALE:
        return const Color(0xFF9E9E9E);
      default:
        return const Color(0xFF9E9E9E);
    }
  }

  IconData get levelIcon {
    switch (level) {
      case DiagnosticStatus.OK:
        return Icons.check_circle;
      case DiagnosticStatus.WARN:
        return Icons.warning;
      case DiagnosticStatus.ERROR:
        return Icons.error;
      case DiagnosticStatus.STALE:
        return Icons.schedule;
      default:
        return Icons.help;
    }
  }
}

class DiagnosticManager extends ChangeNotifier {
  // Map<hardware_id, Map<component_name, DiagnosticState>>
  final Map<String, Map<String, DiagnosticState>> _diagnosticStates = {};
  
  // Stale detection timer
  Timer? _staleCheckTimer;
  
  // Stale time threshold (5 seconds)
  static const Duration _staleThreshold = Duration(seconds: 5);
  // Data removal threshold (remove if not updated for 1 minute)
  static const Duration _removeThreshold = Duration(minutes: 1);
  // For history-type diagnostics, limit max components kept per hardware
  static const int _maxHistoryPerHardware = 50;
  
  // Callback for new errors/warnings
  Function(List<Map<String, dynamic>>)? _onNewErrorsWarnings;
  
  // Constructor
  DiagnosticManager() {
    _startStaleCheckTimer();
  }

  // Destructor
  @override
  void dispose() {
    _stopStaleCheckTimer();
    super.dispose();
  }

  // Start the stale detection timer
  void _startStaleCheckTimer() {
    _staleCheckTimer?.cancel();
    _staleCheckTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _checkForStaleStates();
    });
  }

  // Stop the stale detection timer
  void _stopStaleCheckTimer() {
    _staleCheckTimer?.cancel();
    _staleCheckTimer = null;
  }

  // Check for stale states
  void _checkForStaleStates() {
    bool hasChanges = false;
    final now = DateTime.now();
    List<Map<String, dynamic>> newStaleStates = [];
    var stateHardwareId = <String>[];
    var hardwareToRemove = <String>[];

    for (var hardwareEntry in _diagnosticStates.entries) {
      final componentsToRemove = <String>[];

      for (var componentEntry in hardwareEntry.value.entries) {
        final state = componentEntry.value;
        final timeSinceUpdate = now.difference(state.lastUpdateTime);

        // Remove states not updated for a long time to prevent unbounded data growth
        if (timeSinceUpdate > _removeThreshold) {
          componentsToRemove.add(componentEntry.key);
          hasChanges = true;
          continue;
        }

        // If not updated for more than 5 seconds and not already stale, mark as stale
        if (timeSinceUpdate > _staleThreshold &&
            state.level != DiagnosticStatus.STALE) {
          final newStaleState = state.copyWith(
            level: DiagnosticStatus.STALE,
            message: '(stale)',
            lastUpdateTime: state.lastUpdateTime,
          );

          _diagnosticStates[hardwareEntry.key]![componentEntry.key] =
              newStaleState;
          hasChanges = true;

          if (hardwareEntry.key != "Node Start History" &&
              !stateHardwareId.contains(hardwareEntry.key)) {
            stateHardwareId.add(hardwareEntry.key);
          }
        }
      }

      for (var key in componentsToRemove) {
        hardwareEntry.value.remove(key);
      }
      if (hardwareEntry.value.isEmpty) {
        hardwareToRemove.add(hardwareEntry.key);
      }
    }

    for (var key in hardwareToRemove) {
      _diagnosticStates.remove(key);
    }

    if (hasChanges) {
      notifyListeners();

      // If there are newly stale states, trigger the callback
      if (stateHardwareId.isNotEmpty) {
        for (var hardwareId in stateHardwareId) {
          newStaleStates.add({
            'hardwareId': hardwareId,
            'componentName': '',
            'state': DiagnosticState(
              level: DiagnosticStatus.STALE,
              message: 'data_stale',
            ),
          });
        }
        _onNewErrorsWarnings?.call(newStaleStates);
      }
    }
  }

  // Set callback for new errors/warnings
  void setOnNewErrorsWarnings(Function(List<Map<String, dynamic>>) callback) {
    _onNewErrorsWarnings = callback;
  }

  // Get all hardware IDs
  List<String> get hardwareIds => _diagnosticStates.keys.toList();
  
  // Get all components for the specified hardware
  List<String> getComponentsForHardware(String hardwareId) {
    return _diagnosticStates[hardwareId]?.keys.toList() ?? [];
  }
  
  // Get the state for the specified hardware and component
  DiagnosticState? getState(String hardwareId, String componentName) {
    return _diagnosticStates[hardwareId]?[componentName];
  }
  
  // Get all states for the specified hardware
  Map<String, DiagnosticState> getStatesForHardware(String hardwareId) {
    return Map.from(_diagnosticStates[hardwareId] ?? {});
  }
  
  // Get the highest status level for the specified hardware
  int getMaxLevelForHardware(String hardwareId) {
    final states = _diagnosticStates[hardwareId];
    if (states == null || states.isEmpty) return DiagnosticStatus.OK;
    
    int maxLevel = DiagnosticStatus.OK;
    for (var state in states.values) {
      if (state.level > maxLevel) {
        maxLevel = state.level;
      }
    }
    return maxLevel;
  }
  
  // Get statistics counts for all states
  Map<int, int> getStatusCounts() {
    Map<int, int> counts = {
      DiagnosticStatus.OK: 0,
      DiagnosticStatus.WARN: 0,
      DiagnosticStatus.ERROR: 0,
      DiagnosticStatus.STALE: 0,
    };
    
    for (var hardwareStates in _diagnosticStates.values) {
      for (var state in hardwareStates.values) {
        counts[state.level] = (counts[state.level] ?? 0) + 1;
      }
    }
    
    return counts;
  }
  
  // Update diagnostic states
  void updateDiagnosticStates(DiagnosticArray diagnosticArray) {
    List<Map<String, dynamic>> newErrorsWarnings = []; // Store newly appeared errors and warnings
    
    for (var status in diagnosticArray.status) {

            // This diagnostic is published when the process starts up
      if(status.message== "Node starting up"){
        status.hardwareId="Node Start History";
      }
      final hardwareId = status.hardwareId.isEmpty ? 'unknown_hardware' : status.hardwareId;
      final componentName = status.name;
      
      // Check if this is a new error or warning
      final existingState = _diagnosticStates[hardwareId]?[componentName];
      bool isNewErrorOrWarning = false;
      
      if (status.level == DiagnosticStatus.ERROR || status.level == DiagnosticStatus.WARN) {
        // If there is no prior state, or the prior state is not error/warning, treat as new
        if (existingState == null || 
            (existingState.level != DiagnosticStatus.ERROR && existingState.level != DiagnosticStatus.WARN)) {
          isNewErrorOrWarning = true;
        }
      }
      
      // Create a new state with the current time as the update time
      final newState = DiagnosticState.fromDiagnosticStatus(status);
      
      _diagnosticStates[hardwareId] ??= {};
      // Update the state
      _diagnosticStates[hardwareId]![componentName] = newState;

      // Limit count for history-type diagnostics to prevent unbounded growth
      if (hardwareId == 'Node Start History') {
        final hardwareMap = _diagnosticStates[hardwareId]!;
        if (hardwareMap.length > _maxHistoryPerHardware) {
          final entries = hardwareMap.entries.toList()
            ..sort((a, b) => a.value.lastUpdateTime.compareTo(b.value.lastUpdateTime));
          final toRemove = entries.length - _maxHistoryPerHardware;
          for (var i = 0; i < toRemove; i++) {
            hardwareMap.remove(entries[i].key);
          }
        }
      }
      
      // If this is a new error or warning, add it to the list
      if (isNewErrorOrWarning) {
        newErrorsWarnings.add({
          'hardwareId': hardwareId,
          'componentName': componentName,
          'state': newState,
        });
      }
    }

    // Notify listeners and pass the new errors and warnings
    notifyListeners();
    
    // // If there are new errors or warnings, trigger the callback
    // if (newErrorsWarnings.isNotEmpty) {
    //   _onNewErrorsWarnings?.call(newErrorsWarnings);
    // }
  }
  
  // Clear all diagnostic states
  void clearAllStates() {
    _diagnosticStates.clear();
    notifyListeners();
  }
  
  // Clear states for the specified hardware
  void clearHardwareStates(String hardwareId) {
    _diagnosticStates.remove(hardwareId);
    notifyListeners();
  }
  
  // Clear the state for the specified component
  void clearComponentState(String hardwareId, String componentName) {
    _diagnosticStates[hardwareId]?.remove(componentName);
    if (_diagnosticStates[hardwareId]?.isEmpty == true) {
      _diagnosticStates.remove(hardwareId);
    }
    notifyListeners();
  }
  
  
  // Get a flat list of all diagnostic states (for search and filtering)
  List<MapEntry<String, MapEntry<String, DiagnosticState>>> getAllStates() {
    List<MapEntry<String, MapEntry<String, DiagnosticState>>> result = [];
    
    for (var hardwareEntry in _diagnosticStates.entries) {
      for (var componentEntry in hardwareEntry.value.entries) {
        result.add(MapEntry(hardwareEntry.key, componentEntry));
      }
    }
    
    return result;
  }
  
  // Search diagnostic states
  List<MapEntry<String, MapEntry<String, DiagnosticState>>> searchStates(String query) {
    if (query.isEmpty) return getAllStates();
    
    final lowerQuery = query.toLowerCase();
    return getAllStates().where((entry) {
      final hardwareId = entry.key.toLowerCase();
      final componentName = entry.value.key.toLowerCase();
      final state = entry.value.value;
      
      return hardwareId.contains(lowerQuery) ||
             componentName.contains(lowerQuery) ||
             state.message.toLowerCase().contains(lowerQuery) ||
             state.keyValues.values.any((value) => value.toLowerCase().contains(lowerQuery));
    }).toList();
  }
  
  // Filter by status level
  List<MapEntry<String, MapEntry<String, DiagnosticState>>> filterByLevel(int level) {
    return getAllStates().where((entry) {
      return entry.value.value.level == level;
    }).toList();
  }
}

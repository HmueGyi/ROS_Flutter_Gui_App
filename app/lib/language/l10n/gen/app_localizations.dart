import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @connect_robot.
  ///
  /// In en, this message translates to:
  /// **'Connect To Robot'**
  String get connect_robot;

  /// No description provided for @connect_robot_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Please Input Robot Ip And Port'**
  String get connect_robot_subtitle;

  /// No description provided for @ip_address.
  ///
  /// In en, this message translates to:
  /// **'IP Address'**
  String get ip_address;

  /// No description provided for @port.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get port;

  /// No description provided for @http_server_port.
  ///
  /// In en, this message translates to:
  /// **'HTTP Server Port'**
  String get http_server_port;

  /// No description provided for @robot_type.
  ///
  /// In en, this message translates to:
  /// **'Robot Type'**
  String get robot_type;

  /// No description provided for @default_config_template.
  ///
  /// In en, this message translates to:
  /// **'Default Config Template'**
  String get default_config_template;

  /// No description provided for @max_speed.
  ///
  /// In en, this message translates to:
  /// **'Max Speed'**
  String get max_speed;

  /// No description provided for @max_y_speed.
  ///
  /// In en, this message translates to:
  /// **'Max Y Speed'**
  String get max_y_speed;

  /// No description provided for @max_angular_speed.
  ///
  /// In en, this message translates to:
  /// **'Max Angular Speed'**
  String get max_angular_speed;

  /// No description provided for @map_frame.
  ///
  /// In en, this message translates to:
  /// **'Map Frame'**
  String get map_frame;

  /// No description provided for @odom_frame.
  ///
  /// In en, this message translates to:
  /// **'Odom Frame'**
  String get odom_frame;

  /// No description provided for @base_frame.
  ///
  /// In en, this message translates to:
  /// **'Base Frame'**
  String get base_frame;

  /// No description provided for @laser_frame.
  ///
  /// In en, this message translates to:
  /// **'Laser Frame'**
  String get laser_frame;

  /// No description provided for @map_topic.
  ///
  /// In en, this message translates to:
  /// **'Map Topic'**
  String get map_topic;

  /// No description provided for @laser_topic.
  ///
  /// In en, this message translates to:
  /// **'Laser Topic'**
  String get laser_topic;

  /// No description provided for @global_path_topic.
  ///
  /// In en, this message translates to:
  /// **'Global Path Topic'**
  String get global_path_topic;

  /// No description provided for @local_path_topic.
  ///
  /// In en, this message translates to:
  /// **'Local Path Topic'**
  String get local_path_topic;

  /// No description provided for @trace_path_topic.
  ///
  /// In en, this message translates to:
  /// **'Trace Path Topic'**
  String get trace_path_topic;

  /// No description provided for @reloc_topic.
  ///
  /// In en, this message translates to:
  /// **'Reloc Topic'**
  String get reloc_topic;

  /// No description provided for @nav_goal_topic.
  ///
  /// In en, this message translates to:
  /// **'Nav Goal Topic'**
  String get nav_goal_topic;

  /// No description provided for @odometry_topic.
  ///
  /// In en, this message translates to:
  /// **'Odometry Topic'**
  String get odometry_topic;

  /// No description provided for @speed_ctrl_topic.
  ///
  /// In en, this message translates to:
  /// **'Speed Ctrl Topic'**
  String get speed_ctrl_topic;

  /// No description provided for @battery_topic.
  ///
  /// In en, this message translates to:
  /// **'Battery Topic'**
  String get battery_topic;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @image_topic.
  ///
  /// In en, this message translates to:
  /// **'Image Topic'**
  String get image_topic;

  /// No description provided for @screen_orientation.
  ///
  /// In en, this message translates to:
  /// **'Screen Orientation'**
  String get screen_orientation;

  /// No description provided for @connect_error.
  ///
  /// In en, this message translates to:
  /// **'Connect ROS failed, please check IP and port'**
  String get connect_error;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @config_saved.
  ///
  /// In en, this message translates to:
  /// **'Config saved, restart app to take effect'**
  String get config_saved;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @image_port.
  ///
  /// In en, this message translates to:
  /// **'Image Port'**
  String get image_port;

  /// No description provided for @image_width.
  ///
  /// In en, this message translates to:
  /// **'Image Width'**
  String get image_width;

  /// No description provided for @image_height.
  ///
  /// In en, this message translates to:
  /// **'Image Height'**
  String get image_height;

  /// No description provided for @confirm_change.
  ///
  /// In en, this message translates to:
  /// **'Confirm Change'**
  String get confirm_change;

  /// No description provided for @switch_template_will_reset_all_settings.
  ///
  /// In en, this message translates to:
  /// **'Switch template will reset all settings'**
  String get switch_template_will_reset_all_settings;

  /// No description provided for @portrait.
  ///
  /// In en, this message translates to:
  /// **'Portrait'**
  String get portrait;

  /// No description provided for @landscape.
  ///
  /// In en, this message translates to:
  /// **'Landscape'**
  String get landscape;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @switch_language.
  ///
  /// In en, this message translates to:
  /// **'Switch Language'**
  String get switch_language;

  /// No description provided for @zh.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get zh;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @basic_setting.
  ///
  /// In en, this message translates to:
  /// **'Basic Setting'**
  String get basic_setting;

  /// No description provided for @topic_setting.
  ///
  /// In en, this message translates to:
  /// **'Topic Setting'**
  String get topic_setting;

  /// No description provided for @app_setting.
  ///
  /// In en, this message translates to:
  /// **'APP Setting'**
  String get app_setting;

  /// No description provided for @robot_footprint_topic.
  ///
  /// In en, this message translates to:
  /// **'Robot Footprint Topic'**
  String get robot_footprint_topic;

  /// No description provided for @local_cost_map_topic.
  ///
  /// In en, this message translates to:
  /// **'Local Cost Map Topic'**
  String get local_cost_map_topic;

  /// No description provided for @pointcloud2_topic.
  ///
  /// In en, this message translates to:
  /// **'Point Cloud Topic'**
  String get pointcloud2_topic;

  /// No description provided for @global_costmap_topic.
  ///
  /// In en, this message translates to:
  /// **'Global Cost Map Topic'**
  String get global_costmap_topic;

  /// No description provided for @backend_setting.
  ///
  /// In en, this message translates to:
  /// **'Backend Setting'**
  String get backend_setting;

  /// No description provided for @map_publish_topic.
  ///
  /// In en, this message translates to:
  /// **'Map Publish Topic'**
  String get map_publish_topic;

  /// No description provided for @map_subscribe_topic.
  ///
  /// In en, this message translates to:
  /// **'Map Subscribe Topic'**
  String get map_subscribe_topic;

  /// No description provided for @map_manager_frame.
  ///
  /// In en, this message translates to:
  /// **'Map Manager Frame'**
  String get map_manager_frame;

  /// No description provided for @nav_to_pose_status_topic.
  ///
  /// In en, this message translates to:
  /// **'NavToPose Status Topic'**
  String get nav_to_pose_status_topic;

  /// No description provided for @nav_through_poses_status_topic.
  ///
  /// In en, this message translates to:
  /// **'NavThroughPoses Status Topic'**
  String get nav_through_poses_status_topic;

  /// No description provided for @topology_live_topic.
  ///
  /// In en, this message translates to:
  /// **'Topology Live Topic'**
  String get topology_live_topic;

  /// No description provided for @topology_json_topic.
  ///
  /// In en, this message translates to:
  /// **'Topology JSON Topic'**
  String get topology_json_topic;

  /// No description provided for @topology_publish_topic.
  ///
  /// In en, this message translates to:
  /// **'Topology Publish Topic'**
  String get topology_publish_topic;

  /// No description provided for @diagnostic_topic_label.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic Topic'**
  String get diagnostic_topic_label;

  /// No description provided for @robot_size.
  ///
  /// In en, this message translates to:
  /// **'Robot Icon Size'**
  String get robot_size;

  /// No description provided for @not_allow_send_nav_goal.
  ///
  /// In en, this message translates to:
  /// **'Current mode is not allow to send navigation goal, please checkout to normal mode!'**
  String get not_allow_send_nav_goal;

  /// No description provided for @gamepad_mapping.
  ///
  /// In en, this message translates to:
  /// **'Gamepad Mapping'**
  String get gamepad_mapping;

  /// No description provided for @remap.
  ///
  /// In en, this message translates to:
  /// **'Remap'**
  String get remap;

  /// No description provided for @start_mapping_message.
  ///
  /// In en, this message translates to:
  /// **'Please push the joystick or button to this position to start mapping'**
  String get start_mapping_message;

  /// No description provided for @mapping_reset.
  ///
  /// In en, this message translates to:
  /// **'Mapping has been reset to default settings'**
  String get mapping_reset;

  /// No description provided for @left_stick_x.
  ///
  /// In en, this message translates to:
  /// **'Left Stick X'**
  String get left_stick_x;

  /// No description provided for @left_stick_y.
  ///
  /// In en, this message translates to:
  /// **'Left Stick Y'**
  String get left_stick_y;

  /// No description provided for @right_stick_x.
  ///
  /// In en, this message translates to:
  /// **'Right Stick X'**
  String get right_stick_x;

  /// No description provided for @right_stick_y.
  ///
  /// In en, this message translates to:
  /// **'Right Stick Y'**
  String get right_stick_y;

  /// No description provided for @button_a.
  ///
  /// In en, this message translates to:
  /// **'Button A'**
  String get button_a;

  /// No description provided for @button_b.
  ///
  /// In en, this message translates to:
  /// **'Button B'**
  String get button_b;

  /// No description provided for @button_x.
  ///
  /// In en, this message translates to:
  /// **'Button X'**
  String get button_x;

  /// No description provided for @button_y.
  ///
  /// In en, this message translates to:
  /// **'Button Y'**
  String get button_y;

  /// No description provided for @camera_fixed_no_layer.
  ///
  /// In en, this message translates to:
  /// **'Cannot adjust layers when camera view is fixed!'**
  String get camera_fixed_no_layer;

  /// No description provided for @switch_to_normal_mode.
  ///
  /// In en, this message translates to:
  /// **'Please switch to normal mode first, then click navigation point'**
  String get switch_to_normal_mode;

  /// No description provided for @emergency_stop_triggered.
  ///
  /// In en, this message translates to:
  /// **'Emergency stop triggered!'**
  String get emergency_stop_triggered;

  /// No description provided for @stop_nav.
  ///
  /// In en, this message translates to:
  /// **'Stop Navigation'**
  String get stop_nav;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @layer_grid.
  ///
  /// In en, this message translates to:
  /// **'Grid Layer'**
  String get layer_grid;

  /// No description provided for @layer_global_costmap.
  ///
  /// In en, this message translates to:
  /// **'Global Cost Map'**
  String get layer_global_costmap;

  /// No description provided for @layer_local_costmap.
  ///
  /// In en, this message translates to:
  /// **'Local Cost Map'**
  String get layer_local_costmap;

  /// No description provided for @local_costmap_map_style.
  ///
  /// In en, this message translates to:
  /// **'Display style'**
  String get local_costmap_map_style;

  /// No description provided for @local_costmap_style_raw.
  ///
  /// In en, this message translates to:
  /// **'Raw grid'**
  String get local_costmap_style_raw;

  /// No description provided for @local_costmap_style_costmap.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get local_costmap_style_costmap;

  /// No description provided for @local_costmap_style_obs.
  ///
  /// In en, this message translates to:
  /// **'Obstacles'**
  String get local_costmap_style_obs;

  /// No description provided for @layer_laser.
  ///
  /// In en, this message translates to:
  /// **'Laser Data'**
  String get layer_laser;

  /// No description provided for @layer_pointcloud.
  ///
  /// In en, this message translates to:
  /// **'Point Cloud Data'**
  String get layer_pointcloud;

  /// No description provided for @layer_global_path.
  ///
  /// In en, this message translates to:
  /// **'Global Path'**
  String get layer_global_path;

  /// No description provided for @layer_local_path.
  ///
  /// In en, this message translates to:
  /// **'Local Path'**
  String get layer_local_path;

  /// No description provided for @layer_topology.
  ///
  /// In en, this message translates to:
  /// **'Topology Map'**
  String get layer_topology;

  /// No description provided for @map_edit.
  ///
  /// In en, this message translates to:
  /// **'Map Edit'**
  String get map_edit;

  /// No description provided for @zoom_in.
  ///
  /// In en, this message translates to:
  /// **'Zoom In'**
  String get zoom_in;

  /// No description provided for @zoom_out.
  ///
  /// In en, this message translates to:
  /// **'Zoom Out'**
  String get zoom_out;

  /// No description provided for @center_on_robot.
  ///
  /// In en, this message translates to:
  /// **'Center on Robot'**
  String get center_on_robot;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @layers.
  ///
  /// In en, this message translates to:
  /// **'Layers'**
  String get layers;

  /// No description provided for @layer_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get layer_color;

  /// No description provided for @layer_dot_size.
  ///
  /// In en, this message translates to:
  /// **'Dot size'**
  String get layer_dot_size;

  /// No description provided for @reloc.
  ///
  /// In en, this message translates to:
  /// **'Relocalization'**
  String get reloc;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @manual_control.
  ///
  /// In en, this message translates to:
  /// **'Manual Control'**
  String get manual_control;

  /// No description provided for @emergency_stop.
  ///
  /// In en, this message translates to:
  /// **'Emergency Stop'**
  String get emergency_stop;

  /// No description provided for @stop_navigation.
  ///
  /// In en, this message translates to:
  /// **'Stop Navigation'**
  String get stop_navigation;

  /// No description provided for @open_file.
  ///
  /// In en, this message translates to:
  /// **'Open File'**
  String get open_file;

  /// No description provided for @save_file.
  ///
  /// In en, this message translates to:
  /// **'Save File'**
  String get save_file;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @redo.
  ///
  /// In en, this message translates to:
  /// **'Redo'**
  String get redo;

  /// No description provided for @exit_edit_mode.
  ///
  /// In en, this message translates to:
  /// **'Exit Edit Mode'**
  String get exit_edit_mode;

  /// No description provided for @add_nav_point.
  ///
  /// In en, this message translates to:
  /// **'Add Navigation Point'**
  String get add_nav_point;

  /// No description provided for @draw_obstacle.
  ///
  /// In en, this message translates to:
  /// **'Draw Obstacle'**
  String get draw_obstacle;

  /// No description provided for @erase_obstacle.
  ///
  /// In en, this message translates to:
  /// **'Erase Obstacle'**
  String get erase_obstacle;

  /// No description provided for @add_current_position.
  ///
  /// In en, this message translates to:
  /// **'Add Current Position'**
  String get add_current_position;

  /// No description provided for @map_management.
  ///
  /// In en, this message translates to:
  /// **'Map Management'**
  String get map_management;

  /// No description provided for @save_success.
  ///
  /// In en, this message translates to:
  /// **'Save Success'**
  String get save_success;

  /// No description provided for @save_success_desc.
  ///
  /// In en, this message translates to:
  /// **'Topology map and occupancy map published'**
  String get save_success_desc;

  /// No description provided for @save_failed.
  ///
  /// In en, this message translates to:
  /// **'Save Failed'**
  String get save_failed;

  /// No description provided for @save_as.
  ///
  /// In en, this message translates to:
  /// **'Save As'**
  String get save_as;

  /// No description provided for @map_name.
  ///
  /// In en, this message translates to:
  /// **'Map Name'**
  String get map_name;

  /// No description provided for @save_as_success.
  ///
  /// In en, this message translates to:
  /// **'Save As Success'**
  String get save_as_success;

  /// No description provided for @save_as_desc.
  ///
  /// In en, this message translates to:
  /// **'Saved as: {name}'**
  String save_as_desc(Object name);

  /// No description provided for @save_as_failed.
  ///
  /// In en, this message translates to:
  /// **'Save As Failed'**
  String get save_as_failed;

  /// No description provided for @tool_move.
  ///
  /// In en, this message translates to:
  /// **'Move'**
  String get tool_move;

  /// No description provided for @tool_point.
  ///
  /// In en, this message translates to:
  /// **'Point'**
  String get tool_point;

  /// No description provided for @tool_route.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get tool_route;

  /// No description provided for @tool_brush.
  ///
  /// In en, this message translates to:
  /// **'Brush'**
  String get tool_brush;

  /// No description provided for @tool_eraser.
  ///
  /// In en, this message translates to:
  /// **'Eraser'**
  String get tool_eraser;

  /// No description provided for @route_start_selected.
  ///
  /// In en, this message translates to:
  /// **'Start selected: {name}'**
  String route_start_selected(Object name);

  /// No description provided for @route_created.
  ///
  /// In en, this message translates to:
  /// **'Route created: {from} -> {to}'**
  String route_created(Object from, Object to);

  /// No description provided for @route_properties.
  ///
  /// In en, this message translates to:
  /// **'Route Properties'**
  String get route_properties;

  /// No description provided for @direction.
  ///
  /// In en, this message translates to:
  /// **'Direction: {from} -> {to}'**
  String direction(Object from, Object to);

  /// No description provided for @controller.
  ///
  /// In en, this message translates to:
  /// **'Controller'**
  String get controller;

  /// No description provided for @controller_readonly.
  ///
  /// In en, this message translates to:
  /// **'Controller (Read Only)'**
  String get controller_readonly;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @delete_route.
  ///
  /// In en, this message translates to:
  /// **'Delete This Direction'**
  String get delete_route;

  /// No description provided for @point_properties.
  ///
  /// In en, this message translates to:
  /// **'Point Properties'**
  String get point_properties;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @delete_point.
  ///
  /// In en, this message translates to:
  /// **'Delete This Point'**
  String get delete_point;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @no_map.
  ///
  /// In en, this message translates to:
  /// **'No Map'**
  String get no_map;

  /// No description provided for @default_dynamic_map_tag.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get default_dynamic_map_tag;

  /// No description provided for @editing_map_tag.
  ///
  /// In en, this message translates to:
  /// **'Editing'**
  String get editing_map_tag;

  /// No description provided for @current_in_use.
  ///
  /// In en, this message translates to:
  /// **'In Use'**
  String get current_in_use;

  /// No description provided for @switch_map.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get switch_map;

  /// No description provided for @delete_map_tooltip_current.
  ///
  /// In en, this message translates to:
  /// **'In use, cannot delete'**
  String get delete_map_tooltip_current;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @confirm_delete.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirm_delete;

  /// No description provided for @confirm_delete_map.
  ///
  /// In en, this message translates to:
  /// **'Delete map \"{name}\"? This cannot be undone.'**
  String confirm_delete_map(Object name);

  /// No description provided for @map_deleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted: {name}'**
  String map_deleted(Object name);

  /// No description provided for @delete_failed.
  ///
  /// In en, this message translates to:
  /// **'Delete failed: {e}'**
  String delete_failed(Object e);

  /// No description provided for @position_label.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position_label;

  /// No description provided for @position_format.
  ///
  /// In en, this message translates to:
  /// **'Position: ({x}, {y})'**
  String position_format(Object x, Object y);

  /// No description provided for @init_error.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String init_error(Object error);

  /// No description provided for @diagnostic_warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get diagnostic_warning;

  /// No description provided for @diagnostic_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get diagnostic_error;

  /// No description provided for @diagnostic_stale.
  ///
  /// In en, this message translates to:
  /// **'Stale'**
  String get diagnostic_stale;

  /// No description provided for @diagnostic_normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get diagnostic_normal;

  /// No description provided for @diagnostic_health.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic: [{level}] {component}'**
  String diagnostic_health(Object level, Object component);

  /// No description provided for @diagnostic_hardware.
  ///
  /// In en, this message translates to:
  /// **'Hardware ID: {id}\nMessage: {msg}'**
  String diagnostic_hardware(Object id, Object msg);

  /// No description provided for @error_count.
  ///
  /// In en, this message translates to:
  /// **'Errors: {count}'**
  String error_count(Object count);

  /// No description provided for @warn_count.
  ///
  /// In en, this message translates to:
  /// **'Warnings: {count}'**
  String warn_count(Object count);

  /// No description provided for @nav_point_info.
  ///
  /// In en, this message translates to:
  /// **'Nav Point Info'**
  String get nav_point_info;

  /// No description provided for @position_coords.
  ///
  /// In en, this message translates to:
  /// **'Position Coords'**
  String get position_coords;

  /// No description provided for @coord_x.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get coord_x;

  /// No description provided for @coord_y.
  ///
  /// In en, this message translates to:
  /// **'Y'**
  String get coord_y;

  /// No description provided for @heading.
  ///
  /// In en, this message translates to:
  /// **'Heading'**
  String get heading;

  /// No description provided for @stop_manual_first.
  ///
  /// In en, this message translates to:
  /// **'Please stop manual control first'**
  String get stop_manual_first;

  /// No description provided for @nav_goal_sent.
  ///
  /// In en, this message translates to:
  /// **'Nav goal sent to {name}'**
  String nav_goal_sent(Object name);

  /// No description provided for @send_nav_goal.
  ///
  /// In en, this message translates to:
  /// **'Send Nav Goal'**
  String get send_nav_goal;

  /// No description provided for @emergency_stopped.
  ///
  /// In en, this message translates to:
  /// **'Emergency Stop Triggered'**
  String get emergency_stopped;

  /// No description provided for @nav_stopped.
  ///
  /// In en, this message translates to:
  /// **'Navigation Stopped'**
  String get nav_stopped;

  /// No description provided for @legend_free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get legend_free;

  /// No description provided for @legend_occupied.
  ///
  /// In en, this message translates to:
  /// **'Occupied'**
  String get legend_occupied;

  /// No description provided for @legend_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get legend_unknown;

  /// No description provided for @map_tile_colors.
  ///
  /// In en, this message translates to:
  /// **'Map Colors'**
  String get map_tile_colors;

  /// No description provided for @map_tile_free_thresh.
  ///
  /// In en, this message translates to:
  /// **'Free threshold'**
  String get map_tile_free_thresh;

  /// No description provided for @map_tile_occ_thresh.
  ///
  /// In en, this message translates to:
  /// **'Occupied threshold'**
  String get map_tile_occ_thresh;

  /// No description provided for @nav_goal.
  ///
  /// In en, this message translates to:
  /// **'Nav Goal'**
  String get nav_goal;

  /// No description provided for @charge_station.
  ///
  /// In en, this message translates to:
  /// **'Charge Station'**
  String get charge_station;

  /// No description provided for @layer_trace.
  ///
  /// In en, this message translates to:
  /// **'Trace Path'**
  String get layer_trace;

  /// No description provided for @layer_robot_footprint.
  ///
  /// In en, this message translates to:
  /// **'Robot Footprint'**
  String get layer_robot_footprint;

  /// No description provided for @camera_image.
  ///
  /// In en, this message translates to:
  /// **'Camera Image'**
  String get camera_image;

  /// No description provided for @no_map_available.
  ///
  /// In en, this message translates to:
  /// **'No map available, please select or create one first'**
  String get no_map_available;

  /// No description provided for @invalid_json.
  ///
  /// In en, this message translates to:
  /// **'Import failed: invalid JSON format'**
  String get invalid_json;

  /// No description provided for @data_stale.
  ///
  /// In en, this message translates to:
  /// **'No data update for over 5s'**
  String get data_stale;

  /// No description provided for @unknown_hardware.
  ///
  /// In en, this message translates to:
  /// **'Unknown hardware'**
  String get unknown_hardware;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @update_time.
  ///
  /// In en, this message translates to:
  /// **'Update time'**
  String get update_time;

  /// No description provided for @no_detail.
  ///
  /// In en, this message translates to:
  /// **'No details available'**
  String get no_detail;

  /// No description provided for @last_update.
  ///
  /// In en, this message translates to:
  /// **'Last update'**
  String get last_update;

  /// No description provided for @no_diagnostic_data.
  ///
  /// In en, this message translates to:
  /// **'No diagnostic data'**
  String get no_diagnostic_data;

  /// No description provided for @no_matching_diagnostic.
  ///
  /// In en, this message translates to:
  /// **'No matching diagnostic data found'**
  String get no_matching_diagnostic;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @clear_filter.
  ///
  /// In en, this message translates to:
  /// **'Clear filter'**
  String get clear_filter;

  /// No description provided for @show_hardware_count.
  ///
  /// In en, this message translates to:
  /// **'Showing {count} hardware groups'**
  String show_hardware_count(Object count);

  /// No description provided for @clear_all_filter.
  ///
  /// In en, this message translates to:
  /// **'Clear all filters'**
  String get clear_all_filter;

  /// No description provided for @component_count.
  ///
  /// In en, this message translates to:
  /// **'Components: {count}'**
  String component_count(Object count);

  /// No description provided for @system_diagnostic.
  ///
  /// In en, this message translates to:
  /// **'System Diagnostic'**
  String get system_diagnostic;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @search_component_hint.
  ///
  /// In en, this message translates to:
  /// **'Search component...'**
  String get search_component_hint;

  /// No description provided for @status_filter.
  ///
  /// In en, this message translates to:
  /// **'Status filter'**
  String get status_filter;

  /// No description provided for @table_key.
  ///
  /// In en, this message translates to:
  /// **'Key'**
  String get table_key;

  /// No description provided for @table_value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get table_value;

  /// No description provided for @detail_info.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detail_info;

  /// No description provided for @diagnostic_overview.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic Overview'**
  String get diagnostic_overview;

  /// No description provided for @hardware_id.
  ///
  /// In en, this message translates to:
  /// **'Hardware ID'**
  String get hardware_id;

  /// No description provided for @ssh_config_title.
  ///
  /// In en, this message translates to:
  /// **'SSH'**
  String get ssh_config_title;

  /// No description provided for @ssh_target_same_as_robot.
  ///
  /// In en, this message translates to:
  /// **'Target host matches robot IP: {host}'**
  String ssh_target_same_as_robot(String host);

  /// No description provided for @ssh_username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get ssh_username;

  /// No description provided for @ssh_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get ssh_password;

  /// No description provided for @ssh_save_to_backend.
  ///
  /// In en, this message translates to:
  /// **'Save to server'**
  String get ssh_save_to_backend;

  /// No description provided for @ssh_config_saved.
  ///
  /// In en, this message translates to:
  /// **'SSH settings saved'**
  String get ssh_config_saved;

  /// No description provided for @ssh_remote_section.
  ///
  /// In en, this message translates to:
  /// **'SSH'**
  String get ssh_remote_section;

  /// No description provided for @ssh_config_list_tile_title.
  ///
  /// In en, this message translates to:
  /// **'Login and port'**
  String get ssh_config_list_tile_title;

  /// No description provided for @ssh_not_configured_hint.
  ///
  /// In en, this message translates to:
  /// **'Not configured (stored in gui_app_settings.json on server)'**
  String get ssh_not_configured_hint;

  /// No description provided for @ssh_user_at_host_port.
  ///
  /// In en, this message translates to:
  /// **'{user}@{host}:{port}'**
  String ssh_user_at_host_port(String user, String host, int port);

  /// No description provided for @ssh_required_title.
  ///
  /// In en, this message translates to:
  /// **'SSH setup required'**
  String get ssh_required_title;

  /// No description provided for @ssh_required_body.
  ///
  /// In en, this message translates to:
  /// **'Configure SSH port, username and password (target host matches robot IP; saved on server).'**
  String get ssh_required_body;

  /// No description provided for @ssh_go_configure.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get ssh_go_configure;

  /// No description provided for @ssh_quick_commands_tooltip.
  ///
  /// In en, this message translates to:
  /// **'SSH quick commands'**
  String get ssh_quick_commands_tooltip;

  /// No description provided for @ssh_terminal_tooltip.
  ///
  /// In en, this message translates to:
  /// **'SSH terminal'**
  String get ssh_terminal_tooltip;

  /// No description provided for @ssh_quick_page_title.
  ///
  /// In en, this message translates to:
  /// **'SSH quick commands'**
  String get ssh_quick_page_title;

  /// No description provided for @ssh_quick_save_list_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Save list'**
  String get ssh_quick_save_list_tooltip;

  /// No description provided for @ssh_quick_platform_unsupported.
  ///
  /// In en, this message translates to:
  /// **'SSH is not supported on this platform'**
  String get ssh_quick_platform_unsupported;

  /// No description provided for @ssh_quick_add_title.
  ///
  /// In en, this message translates to:
  /// **'Add quick command'**
  String get ssh_quick_add_title;

  /// No description provided for @ssh_quick_label_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get ssh_quick_label_name;

  /// No description provided for @ssh_quick_label_cmd.
  ///
  /// In en, this message translates to:
  /// **'Command'**
  String get ssh_quick_label_cmd;

  /// No description provided for @ssh_quick_use_sudo.
  ///
  /// In en, this message translates to:
  /// **'Run with sudo (uses SSH password)'**
  String get ssh_quick_use_sudo;

  /// No description provided for @ssh_quick_sudo_need_password.
  ///
  /// In en, this message translates to:
  /// **'SSH password required when sudo is enabled'**
  String get ssh_quick_sudo_need_password;

  /// No description provided for @ssh_quick_no_output.
  ///
  /// In en, this message translates to:
  /// **'(no output)'**
  String get ssh_quick_no_output;

  /// No description provided for @ssh_quick_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get ssh_quick_close;

  /// No description provided for @ssh_quick_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get ssh_quick_cancel;

  /// No description provided for @ssh_quick_add_btn.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get ssh_quick_add_btn;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

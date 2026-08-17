#pragma once

#include "core/map/json.hpp"
#include <map>
#include <algorithm>

namespace ros_gui_backend
{

enum class TopologyMapPointType{
  NavGoal=0,
  ChargingStation=1,
};

// Define mapping between enum values and strings
NLOHMANN_JSON_SERIALIZE_ENUM(TopologyMapPointType, {
    {TopologyMapPointType::NavGoal, "NavGoal"},
    {TopologyMapPointType::ChargingStation, "ChargingStation"}
})

struct TopologyMap {
  struct PointInfo {
    double x{0};
    double y{0};
    double theta{0};
    std::string name{""};
    TopologyMapPointType type{TopologyMapPointType::NavGoal};

    PointInfo() {}
    PointInfo(double _x, double _y, double _theta, std::string _name)
        : x(_x), y(_y), theta(_theta), name(_name) {}

    // Reflection macro
    NLOHMANN_DEFINE_TYPE_INTRUSIVE_WITH_DEFAULT(PointInfo, x, y, theta, name, type)
  };

  struct MapProperty {
    std::vector<std::string> support_controllers{"FollowPath"};
    std::vector<std::string> support_goal_checkers{"general_goal_checker"};

    MapProperty() {}
    
    // Reflection macro
    NLOHMANN_DEFINE_TYPE_INTRUSIVE_WITH_DEFAULT(MapProperty, support_controllers, support_goal_checkers)
  };

  struct RouteInfo {
    std::string controller{"FollowPath"};
    std::string goal_checker{"general_goal_checker"};
    float speed_limit{1.0};

    RouteInfo() {}
    RouteInfo(const std::string& _controller, const std::string& _goal_checker, float _speed_limit) : controller(_controller), goal_checker(_goal_checker), speed_limit(_speed_limit) {}

    // Reflection macro
    NLOHMANN_DEFINE_TYPE_INTRUSIVE_WITH_DEFAULT(RouteInfo, controller, goal_checker, speed_limit)
  };

  std::string map_name;
  MapProperty map_property;
  std::vector<PointInfo> points;
  std::map<std::string, std::map<std::string, RouteInfo>> routes;

  void AddPoint(const PointInfo &point) { points.push_back(point); }
  void RemovePoint(const std::string &name) {
    auto it =
        std::find_if(points.begin(), points.end(), [&](const PointInfo &point) {
          return point.name == name;
        });
    if (it != points.end()) {
      points.erase(it);
    }
  }
  void UpdatePoint(const std::string &name, const PointInfo &point) {
    auto it =
        std::find_if(points.begin(), points.end(), [&](const PointInfo &point) {
          return point.name == name;
        });
    if (it != points.end()) {
      *it = point;
    }
  }
  PointInfo GetPoint(const std::string &name) {
    auto it =
        std::find_if(points.begin(), points.end(), [&](const PointInfo &point) {
          return point.name == name;
        });
    if (it != points.end()) {
      return *it;
    }
    // If the point is not found, return an empty PointInfo object
    return PointInfo();
  }
  std::vector<PointInfo> GetPoints() { return points; }
};

// Custom serialization/deserialization for routes field, supporting array format
inline void to_json(nlohmann::json& j, const TopologyMap& t) {
  j = nlohmann::json{
    {"map_name", t.map_name},
    {"map_property", t.map_property},
    {"points", t.points}
  };
  
  // Convert map format routes to array format
  nlohmann::json routes_array = nlohmann::json::array();
  for (const auto& route_pair : t.routes) {
    const std::string& from_point = route_pair.first;
    const auto& destinations = route_pair.second;
    
    for (const auto& dest_pair : destinations) {
      const std::string& to_point = dest_pair.first;
      const TopologyMap::RouteInfo& route_info = dest_pair.second;
      
      routes_array.push_back({
        {"from_point", from_point},
        {"to_point", to_point},
        {"route_info", route_info}
      });
    }
  }
  j["routes"] = routes_array;
}

inline void from_json(const nlohmann::json& j, TopologyMap& t) {
  if (j.contains("map_name")) {
    j.at("map_name").get_to(t.map_name);
  }
  if (j.contains("map_property")) {
    j.at("map_property").get_to(t.map_property);
  }
  if (j.contains("points")) {
    j.at("points").get_to(t.points);
  }
  
  // Convert array format routes to map format
  t.routes.clear();
  if (j.contains("routes")) {
    if (j["routes"].is_array()) {
      // Array format: {"from_point": "...", "to_point": "...", "route_info": {...}}
      for (const auto& route_item : j["routes"]) {
        std::string from_point = route_item.at("from_point").get<std::string>();
        std::string to_point = route_item.at("to_point").get<std::string>();
        TopologyMap::RouteInfo route_info;
        route_item.at("route_info").get_to(route_info);
        t.routes[from_point][to_point] = route_info;
      }
    } else if (j["routes"].is_object()) {
      // Object format (backward compatible): {"from_point": {"to_point": {...}}}
      for (const auto& route_pair : j["routes"].items()) {
        std::string from_point = route_pair.key();
        for (const auto& dest_pair : route_pair.value().items()) {
          std::string to_point = dest_pair.key();
          TopologyMap::RouteInfo route_info;
          dest_pair.value().get_to(route_info);
          t.routes[from_point][to_point] = route_info;
        }
      }
    }
  }
}

}
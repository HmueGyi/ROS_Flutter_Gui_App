# Usage Tutorial

## Start ROS Environment

1. Start rosbridge:

```bash
# ROS1
roslaunch rosbridge_server rosbridge_websocket.launch

# ROS2
ros2 launch rosbridge_server rosbridge_websocket_launch.xml
```

2. Start web_video_server (optional):

```bash
# ROS1
rosrun web_video_server web_video_server

# ROS2
ros2 run web_video_server web_video_server
```

## Connection Settings

Enter the host where the backend is located and the **HTTP port** (matches `web_server.port` in `config.yaml`, default **8080**) and click Connect:
![camera](../doc/image/connect_page.png) 

## Feature Usage

### Map Editing

Click the icon in the upper right corner to enter map editing mode. In edit mode, you can add navigation points and draw obstacles (supported later)
![camera](../doc/image/edit_map_icon.png) 

#### Topology Map Editing
- Subscribe to the /map/topology topic, message type definition: https://github.com/chengyangkj/topology_msgs
- Click the save button to automatically publish the topology map to the /map/topology/update topic, message type definition: https://github.com/chengyangkj/topology_msgs. Users can subscribe to this topic and save it.

![main](../doc/image/nav_point_edit.png)


### Robot Control

- The left joystick controls vx/vy
- The right joystick controls rotation vw
- Click the relocate button to manually set the robot position

![main](../doc/image/main.gif)

### Camera Display

1. Make sure web_video_server is started
2. Configure the camera topic and port in the settings
3. Click the camera button to view the image stream

Note: Camera display depends on the flutter mjpeg library, but mjpeg does not currently support the web platform.

![camera](../doc/image/camera.png) 

### Diagnostic Information Display

Click the status button at the top to enter the diagnostic interface. This listens to the /diagnostics topic, which can be changed in the settings.
![diag_icon](../doc/image/diag_icon.png) 

Diagnostic interface:
![diag_page](../doc/image/diag_page.png) 
![diag_page](../doc/image/diag_page_2.png)

Because ros2 publishes startup information to /diagnostics when all processes start, the APP collects process startup information under Node Start History.

The software will determine if the diagnostic information is stale. If no diagnostic information is sent for more than 5s, it will be marked as stale.

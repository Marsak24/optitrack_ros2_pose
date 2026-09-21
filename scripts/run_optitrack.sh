#!/bin/bash
set -e

source /opt/ros/humble/setup.bash

NATNET_DIR="$HOME/ros2_ws/src/natnet_ros2/deps/NatNetSDK/samples/PythonClient"

if [ ! -f "$NATNET_DIR/PythonSample_ROS2.py" ]; then
    echo "PythonSample_ROS2.py not found at:"
    echo "$NATNET_DIR"
    exit 1
fi

cd "$NATNET_DIR"
python3 PythonSample_ROS2.py

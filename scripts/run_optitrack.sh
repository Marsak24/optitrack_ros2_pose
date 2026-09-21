#!/bin/bash
set -e

source /opt/ros/humble/setup.bash

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Path to the official OptiTrack NatNet Python client.
# Override with NATNET_DIR if your SDK is installed elsewhere.
NATNET_DIR="${NATNET_DIR:-$HOME/ros2_ws/src/natnet_ros2/deps/NatNetSDK/samples/PythonClient}"

if [ ! -f "$NATNET_DIR/NatNetClient.py" ]; then
    echo "ERROR: NatNetClient.py not found."
    echo "Expected at:"
    echo "$NATNET_DIR/NatNetClient.py"
    echo
    echo "Set NATNET_DIR to your NatNet SDK PythonClient directory."
    exit 1
fi

export PYTHONPATH="$NATNET_DIR${PYTHONPATH:+:$PYTHONPATH}"

python3 "$REPO_DIR/PythonSample_ROS2.py"

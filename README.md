# OptiTrack to ROS 2 Pose Streaming

A lightweight ROS 2 interface for streaming OptiTrack Motive rigid-body poses through the NatNet Python client.

This repository contains the `PythonSample_ROS2.py` script used in my working OptiTrack–ROS 2 setup. The script connects the NatNet rigid-body stream to ROS 2 and publishes the tracked pose as a `geometry_msgs/msg/PoseStamped` message.

## Tested Setup

* Ubuntu
* ROS 2 Humble
* OptiTrack Motive
* NatNet SDK / NatNet Python Client
* NatNet unicast streaming

## ROS 2 Output

The publisher outputs:

* Topic: `/optitrack/pose`
* Message type: `geometry_msgs/msg/PoseStamped`
* Frame ID: `optitrack`

## Repository Contents

```text
optitrack_ros2_pose/
├── PythonSample_ROS2.py
├── README.md
└── scripts/
    └── run_optitrack.sh
```

`PythonSample_ROS2.py` contains the ROS 2 integration used for the working setup.

The official OptiTrack `NatNetClient.py` is **not redistributed in this repository** and must be obtained from the OptiTrack NatNet SDK.

## Dependencies

Install ROS 2 Humble and obtain the OptiTrack NatNet SDK.

The tested NatNet Python client was located at:

```text
~/ros2_ws/src/natnet_ros2/deps/NatNetSDK/samples/PythonClient/
```


The NatNet Python client directory must contain the required SDK modules, including:

NatNetClient.py
DataDescriptions.py
MoCapData.py


## Run

Clone this repository:

```bash
git clone https://github.com/Marsak24/optitrack_ros2_pose.git
cd optitrack_ros2_pose
```

By default, the launcher expects `NatNetClient.py` at:

```text
~/ros2_ws/src/natnet_ros2/deps/NatNetSDK/samples/PythonClient/
```

Run:

```bash
./scripts/run_optitrack.sh
```

If your NatNet SDK is installed somewhere else:

```bash
NATNET_DIR=/path/to/NatNetSDK/samples/PythonClient \
./scripts/run_optitrack.sh
```

You can also run the publisher manually:

```bash
source /opt/ros/humble/setup.bash

export PYTHONPATH=/path/to/NatNetSDK/samples/PythonClient:$PYTHONPATH

python3 PythonSample_ROS2.py
```

## NatNet Configuration

The tested setup used **unicast** streaming.

When the program starts, select:

```text
Select 0 for multicast and 1 for unicast: 1
```

Then provide:

* **Client Address:** IP address of the Ubuntu computer running ROS 2
* **Server Address:** IP address of the computer running OptiTrack Motive
* **Stream type:** `d` for datastream

The actual IP addresses depend on the local OptiTrack network.

## Verify the ROS 2 Stream

List the topic:

```bash
ros2 topic list | grep optitrack
```

Inspect one pose:

```bash
ros2 topic echo /optitrack/pose --once
```

Check the publishing frequency:

```bash
ros2 topic hz /optitrack/pose
```

## Notes

This repository contains the ROS 2 integration used to publish OptiTrack rigid-body tracking data.

The OptiTrack NatNet Python client (`NatNetClient.py`) is an external dependency and is not redistributed here.

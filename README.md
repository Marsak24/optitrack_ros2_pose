# OptiTrack to ROS 2 Pose Streaming

A simple setup for streaming OptiTrack Motive rigid-body poses into ROS 2 using the official OptiTrack NatNet Python client.

## Tested Setup

* Ubuntu
* ROS 2 Humble
* OptiTrack Motive
* NatNet SDK
* NatNet unicast streaming

## ROS 2 Output

The working setup publishes OptiTrack rigid-body poses as:

* Topic: `/optitrack/pose`
* Message type: `geometry_msgs/msg/PoseStamped`
* Frame ID: `optitrack`

## Dependencies

Install ROS 2 Humble and obtain the official OptiTrack NatNet SDK.

This repository does not redistribute the NatNet SDK.

The tested NatNet Python client was located at:

```text
~/ros2_ws/src/natnet_ros2/deps/NatNetSDK/samples/PythonClient/
```

The ROS 2-enabled sample used was:

```text
PythonSample_ROS2.py
```

## Run

Source ROS 2:

```bash
source /opt/ros/humble/setup.bash
```

Go to the NatNet Python client:

```bash
cd ~/ros2_ws/src/natnet_ros2/deps/NatNetSDK/samples/PythonClient
```

Run:

```bash
python3 PythonSample_ROS2.py
```

Alternatively, use the included convenience script:

```bash
./scripts/run_optitrack.sh
```

## NatNet Configuration

The tested setup used **unicast** streaming.

When prompted by `PythonSample_ROS2.py`:

```text
Select 0 for multicast and 1 for unicast: 1
```

Enter:

* **Client Address:** IP address of the Ubuntu/ROS 2 computer
* **Server Address:** IP address of the computer running OptiTrack Motive
* **Stream type:** `d` for datastream

The actual addresses depend on the local OptiTrack network.

## Verify ROS 2 Output

List the OptiTrack topic:

```bash
ros2 topic list | grep optitrack
```

Inspect a pose:

```bash
ros2 topic echo /optitrack/pose --once
```

Check the publishing frequency:

```bash
ros2 topic hz /optitrack/pose
```

## Notes

`PythonSample_ROS2.py` and `NatNetClient.py` are provided by the OptiTrack NatNet SDK and are not redistributed in this repository.

This repository documents the setup used to connect OptiTrack Motive rigid-body tracking to ROS 2 and provides a convenience launcher for reproducing the workflow.

#!/bin/bash
cd /midea_robot/ros2_ws

if [[ ! (-d /midea_robot/ros2_ws/src/ros1_bridge) ]]; then
    mkdir src
    cd src
    git clone https://github.com/ros2/ros1_bridge.git
    cd /midea_robot/ros2_ws
fi

source /opt/ros/humble/setup.bash
colcon build --symlink-install --packages-skip
source /opt/ros/noetic/setup.bash
source /opt/ros/humble/local_setup.bash
source /midea_robot/ros1_ws/devel/setup.bash
source /midea_robot/ros2_ws/install/local_setup.bash

colcon build --symlink-install --packages-select ros1_bridge --cmake-force-configure


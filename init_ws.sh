#!/bin/bash
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${YELLOW} WARNING! You don't need to run this script if both ROS1/2 workspaces have been initialized before.${NC}\n"
read -p "Proceed? (y/n)" proceed
if [[ ${proceed} != "y" ]]; then
    exit
fi

cd /midea_robot/ros1_ws
if [[ ! -d src ]]; then
    mkdir src
fi
source /opt/ros/noetic/setup.bash
catkin_make
chmod a+rw -R /midea_robot/ros1_ws


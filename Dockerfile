FROM osrf/ros:melodic-desktop-full

ENV CERES_VERSION="1.14.0"
ENV OPENCV_VERSION="3.4.16"
ENV OPENCV_CONTRIB_VERSION="3.4.16"

RUN   apt-get update && apt-get install -y \
      cmake \
      libatlas-base-dev \
      libeigen3-dev \
      libgoogle-glog-dev \
      libsuitesparse-dev \
      python-catkin-tools \
      gfortran \
      ros-${ROS_DISTRO}-cv-bridge \
      ros-${ROS_DISTRO}-image-transport \
      ros-${ROS_DISTRO}-message-filters \
      ros-${ROS_DISTRO}-tf && \
      rm -rf /var/lib/apt/lists/*

# Build and install Ceres
RUN   git clone https://ceres-solver.googlesource.com/ceres-solver && \
      cd ceres-solver && \
      git checkout ${CERES_VERSION} && \
      mkdir build && cd build && \
      cmake .. && \
      make install && \
      rm -rf ../../ceres-solver

# Build and install Opencv-3.4.16 and contrib
RUN   git clone https://github.com/opencv/opencv.git && \
      cd opencv && \
      git checkout ${OPENCV_VERSION} && \
      git clone https://github.com/opencv/opencv_contrib.git && \
      git checkout ${OPENCV_CONTRIB_VERSION} && \
      mkdir build && cd build && \
      cmake -DCMAKE_BUILD_TYPE=Release -DGLIBCXX_USE_CXX11_ABI=0 -DCMAKE_INSTALL_PREFIX=/usr/local  -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules .. && \
      make install && \
      rm -rf ../../opencv


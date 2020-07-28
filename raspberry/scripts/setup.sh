sudo apt-get update && \
    sudo apt upgrade -y && \
    sudo apt-get install -y git nano curl sudo man wget unzip tar gnupg2 lsb-release\
    vim lsb-release build-essential autoconf libtool cmake pkg-config \
    python3-dev python3 python3-pip && \
    DEBIAN_FRONTEND=noninteractive sudo apt-get install -qq tzdata && \
    sudo groupadd gpio && \
    sudo adduser $USER gpio

#====== install dev package =====
#    pip install --upgrade pip && \
sudo apt install -y vim lsb-release build-essential autoconf libtool cmake pkg-config && \
    sudo apt install -y python3-dev python3 python3-pip && \
    pip3 install --user --upgrade pip

#====== INSTALL wiringPi ====
pip3 install wiringpi && \
    pip3 install -U pip setuptools && \
    pip3 install libusb1 enum34 psutil

#====== PRE INSTALL ROS 1 ==== && \
    sudo locale-gen en_US en_US.UTF-8 && \
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    sudo apt update

#====== PRE INSTALL ROS 2 ====
sudo apt update && \
    sudo apt install -y wget curl gnupg2 lsb-release lsb-core && \
    sudo locale-gen en_US en_US.UTF-8 && \
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    sudo apt update && sudo apt install curl gnupg2 lsb-release && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - && \
    sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    sudo apt update


sudo groupadd docker

sudo gpasswd -a $USER docker
sudo chown $USER:docker ~/.docker

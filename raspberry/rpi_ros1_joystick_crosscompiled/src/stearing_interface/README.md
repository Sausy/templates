# Generall Info
https://wiki.ubuntu.com/ARM/RaspberryPi

(at the point of writing arm64: 18.04.4 LTS)

unxz file.img.xz

sudo dd if=file.img of=/dev/mmcblk0 bs=1M status=progress

## find rpi
sudo nmap -nsP 192.168.0.0/24

## Install essential stuff

```
sudo apt update
sudo apt install build-essential git python python-pip python-dev wget curl
Sudo apt install gnupg2 lsb-release python3-pip
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
```
```
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
```

```
pip3 install --user --upgrade pip
pip3 install wiringpi
pip3 install -U pip setuptools  
pip3 install libusb1 enum34 psutil
```

Installing wiringpi
```
cd
mkdir libs
cd libs

git clone https://github.com/WiringPi/WiringPi.git
cd wiringPi
git pull origin
./build
```

## ROS 1

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo uptdate
sudo apt install ros-melodic-desktop   
```

## ROS 2

```
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
sudo apt update  
sudo apt install ros-eloquent-ros-base
```

## ROS 1 / 2 Toggel script
source different stuff for ros1 and ros2  

```
mkdir ~/scripts/
```

### ros 1 source
```
nano ~/scripts/ros_1_source.sh
```
```
export ROS_VERSION=1

export ROS_IP=$(hostname -I|head -n1 | awk '{print $1;'})
export ROS_MASTER_URI=http://$ROS_IP:11311
#export ROS_MASTER_URI=http://192.168.0.105:11311

source /opt/ros/melodic/setup.bash
```

### ros 2 source

```
nano ~/scripts/ros_2_source.sh
```
```
export ROS_VERSION=2
source /opt/ros/eloquent/setup.bash
```

### main script

```
nano ros_switch.sh   
```

```
#!/bin/bash

if [ "$1" = "1" ]
then

    echo "switched to ros1"
    source ~/scripts/ros_1_source.sh

else

    echo "switched to ros2"
    source ~/scripts/ros_2_source.sh

fi
```


Add the following line to the end of ~/.profile  
```
export ROS_VERSION=1
```
Add the following line to the end of ~/.bashrc
```
source ~/scripts/ros_switch.sh $ROS_VERSION
```


# Uart
The UART interface is shared with the bluetooth interface

PIN 14/15
|x   |   5V  |
|x   |   5V  |
|x   |   GND |
|x   |   TX  |
|GND |   RX  |
......

```
$ raspberry-config
```
under interfaces >> serial >> disable bluetooth
```
$ sudo nano /boot/config.txt
```
add the folowing lines at the end

dtoverlay=pi3-disable-bt
dtoverlay=pi3-miniuart-bt


For CMakeList only
-lwiringPi needs to be added
```
target_link_libraries( rpi_ros_uart -lwiringPi -lpthread -lrt -lm ${catkin_LIBRARIES})
```

# Add Steam Controller  

```
sudo apt install joystick
sudo apt install ros-melodic-joy
```
https://wiki.gentoo.org/wiki/Steam_Controller


```
sudo jstest /dev/input/js0

roscore  
rosparam set joy_node/dev "/dev/input/js0"

rosrun joy joy_node
```

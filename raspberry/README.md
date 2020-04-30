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

### Installing wiringpi
```
cd
mkdir libs
cd libs

git clone https://github.com/WiringPi/WiringPi.git
cd wiringPi
git pull origin
./build
```

to figure out the gpios run
```
gpio readall
```
which gives us
+-----+-----+---------+------+---+---Pi 3B--+---+------+---------+-----+-----+
| BCM | wPi |   Name  | Mode | V | Physical | V | Mode | Name    | wPi | BCM |
+-----+-----+---------+------+---+----++----+---+------+---------+-----+-----+
|     |     |    3.3v |      |   |  1 || 2  |   |      | 5v      |     |     |
|   2 |   8 |   SDA.1 | ALT0 | 1 |  3 || 4  |   |      | 5v      |     |     |
|   3 |   9 |   SCL.1 | ALT0 | 1 |  5 || 6  |   |      | 0v      |     |     |
|   4 |   7 | GPIO. 7 |   IN | 1 |  7 || 8  | 1 | ALT5 | TxD     | 15  | 14  |
|     |     |      0v |      |   |  9 || 10 | 1 | ALT5 | RxD     | 16  | 15  |
|  17 |   0 | GPIO. 0 |   IN | 0 | 11 || 12 | 0 | IN   | GPIO. 1 | 1   | 18  |
|  27 |   2 | GPIO. 2 |   IN | 0 | 13 || 14 |   |      | 0v      |     |     |
|  22 |   3 | GPIO. 3 |   IN | 0 | 15 || 16 | 0 | IN   | GPIO. 4 | 4   | 23  |
|     |     |    3.3v |      |   | 17 || 18 | 0 | IN   | GPIO. 5 | 5   | 24  |
|  10 |  12 |    MOSI |  OUT | 0 | 19 || 20 |   |      | 0v      |     |     |
|   9 |  13 |    MISO |  OUT | 1 | 21 || 22 | 1 | OUT  | GPIO. 6 | 6   | 25  |
|  11 |  14 |    SCLK | ALT0 | 0 | 23 || 24 | 1 | OUT  | CE0     | 10  | 8   |
|     |     |      0v |      |   | 25 || 26 | 1 | OUT  | CE1     | 11  | 7   |
|   0 |  30 |   SDA.0 |   IN | 1 | 27 || 28 | 1 | IN   | SCL.0   | 31  | 1   |
|   5 |  21 | GPIO.21 |   IN | 1 | 29 || 30 |   |      | 0v      |     |     |
|   6 |  22 | GPIO.22 |   IN | 1 | 31 || 32 | 0 | IN   | GPIO.26 | 26  | 12  |
|  13 |  23 | GPIO.23 |   IN | 0 | 33 || 34 |   |      | 0v      |     |     |
|  19 |  24 | GPIO.24 |   IN | 0 | 35 || 36 | 0 | IN   | GPIO.27 | 27  | 16  |
|  26 |  25 | GPIO.25 |   IN | 0 | 37 || 38 | 0 | IN   | GPIO.28 | 28  | 20  |
|     |     |      0v |      |   | 39 || 40 | 0 | IN   | GPIO.29 | 29  | 21  |
+-----+-----+---------+------+---+----++----+---+------+---------+-----+-----+
| BCM | wPi |   Name  | Mode | V | Physical | V | Mode | Name    | wPi | BCM |
+-----+-----+---------+------+---+---Pi 3B--+---+------+---------+-----+-----+


### permissions errors
To allow the default user to acess /dev/mem and /dev/gpiomem, create gpio group
but first check if there is already a group
```
ll /dev/mem
```
>> crw-r----- 1 root kmem 1, 1 Feb  3 18:41 /dev/mem

for example shows in my case that it belongs to kmem group so there is no need to create a new one
BUT (btw you should give the group kmem writing privilges ... not sure why but it fucks my system)

For /dev/gpiomem
```
ll /dev/gpiomem
```
>>crw------- 1 root root 240, 0 Feb  3 18:41 /dev/gpiomem

belongs to root therefor:
```
sudo groupadd gpio
sudo chown root.gpio /dev/gpiomem
sudo chmod g+rw /dev/gpiomem
```

Finaly add the current user (in my case pi)
```
sudo adduser pi gpio
sudo adduser pi kmem
```

TIPP: if it still doesn't work just exit ssh and reconnect
ensure with the command "id" that gpio group is activ
(I mean there is a diverent solution but too much writing)

### make it permanent
if those changes didn't fuck up you system, make those rules permanent
To ensure that the attributes are the correct ones
```
udevadm info -a -n /dev/gpiomem
```
and then add it to "/etc/udev/rules.d/99-wiringpi.rules" file
```
SUBSYSTEM=="bcm2835-gpiomem", KERNEL=="gpiomem", OWNER="root", GROUP="gpio", MODE="0660"
```

```
sudo chown root:root /etc/udev/rules.d/99-wiringpi.rules
sudo chmod 0644 /etc/udev/rules.d/99-wiringpi.rules
udevadm control --reload-rules
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
elif [ "$1" = "2" ]
then
    echo "switched to ros2"
    source ~/scripts/ros_2_source.sh
else
    echo "ROS_VERSION not set...default ROS 1"
    source ~/scripts/ros_1_source.sh
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

# Usefull cmds
## ssh
ssh-keygen -t rsa
ssh b@B mkdir -p .ssh
cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'

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
short
```
sudo apt update && apt install -y build-essential git python python-pip python-dev wget curl gnupg2 lsb-release python3-pip python-rosdep python-rosinstall python-rosinstall-generator python-wstool
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

## Create Wifi-Hotspot

Config a static ip for the interface that will run a dhcp.
```
sudo apt install -y network-manager
sudo systemctl start network-manager.service
sudo systemctl enable network-manager.service
```

### Create AP 
Create a Config File with **nmcli**
```
sudo nmcli dev wifi hotspot ifname wlan0 ssid rpissid password "test1234"
```
This file can be found in **/etc/NetworkManager/system-connections/Hotspot**

Edit this file in **[connection]**
```
autoconnect=true
```

**Set Interface Static IP**
And to set a a static IP, edit **[ipv4]**

```
address1=192.168.1.1/24,192.168.1.1
```

**Verify Static IP **
```
sudo systemctl restart network-manager.service
```
and Display all interfaces
```
ip addr | grep wlan0
```

### Adding a dhcp server
First of all install a dhcp server (e.g.: isc-dhcp)
```
sudo apt install -y isc-dhcp-server
```
To only run it on **wlan0 Interface**, edit the file **/etc/default/isc-dhcp-server**
```
INTERFACES="wlan0"
```

Die Konfiguration des DHCP-Servers geschieht in der Datei **/etc/dhcp/dhcpd.conf**

Just add the following at the end

```
subnet 192.168.1.0 netmask 255.255.255.0 {
  range 192.168.1.10 192.168.1.100;
  option domain-name-servers 192.168.1.1;
  option domain-name "local";
  option broadcast-address 192.168.1.255;
  option subnet-mask 255.255.255.0;
  option routers 192.168.1.1;
  interface wlan0;
}
```



/etc/init.d/isc-dhcp-server start
/etc/init.d/isc-dhcp-server status

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



# CrossCompile HARDCORE
## Normal ...
For ARM 32bit toolchain

$ sudo apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf

For ARM 64bit toolchain

$ sudo apt-get install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu pkg-config-aarch64-linux-gnu

Step 4: Install package dependencies
$ sudo apt-get install build-essential autoconf libtool cmake pkg-config git python-dev swig3.0 libpcre3-dev nodejs-dev

sudo apt install lib32z1-dev



```
CMakeList.txt
```
```
cmake_minimum_required(VERSION 2.8)
project(HelloWorld)


# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
SET(CMAKE_C_COMPILER   /usr/bin/aarch64-linux-gnu-gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH /usr/aarch64-linux-gnu)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# end of the file


add_executable(HelloWorld main.cpp )
target_link_libraries(HelloWorld)
```

## Cleanest Solution using Docker

Install docker on local and target machine
https://docs.docker.com/engine/install/ubuntu/

and install
```
sudo apt install debootstrap dirmngr
```

to use doker without sudo
```
sudo groupadd docker
sudo usermod -aG docker $USER
```

usefull cmd:
sudo docker ps --all

sudo docker container rm 42249c9927b5

show all local images
```
sudo docker images --all
```
and do remove a container
```
sudo docker rmi 6cbc7081744b
```

### Use docker img different architectur
Requirements:
```
sudo apt install qemu binfmt-support qemu-user-static
```
execute the registering scripts
!!!!! this has to be executed when ever you restart you pc ... but i don't shut it down so its your problem
```
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes --credential yes
```

test your docker imag

```
docker run --rm -t aarch64/ubuntu uname -m
docker run -i -t aarch64/ubuntu /bin/bash
```

### Dockerfile
simple build file called
Dockerfile
```
FROM aarch64/ubuntu
RUN apt update
RUN apt upgrade -y
CMD ["/bin/bash"]
```

example with EXPERIMENTAL features to allow plattform
to enable EXPERIMENTAL features  (some with yamal possibel but didn't work for me )
```
sudo service docker stop
sudo dockerd --experimental
```
to check if ok
```

```

now basic Dockerfile for rpi arm 64 with user udev
```
FROM --platform=linux/arm64 ubuntu:18.04


#====== basic setup =====
#....this includes adding a user called "userdev:ubuntu" which is part of sudo
RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y git nano curl sudo man wget && \
    echo "root:ubuntu" | chpasswd && \
    useradd -ms /bin/bash userdev && \
    echo "userdev:ubuntu" | chpasswd && \
    adduser userdev sudo && \
    echo "userdev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    groupadd gpio && \
    adduser userdev gpio

#====== install dev package =====
#    pip install --upgrade pip && \
RUN apt install -y vim lsb-release build-essential autoconf libtool cmake pkg-config && \
    apt install -y python3-dev python3 python3-pip && \
    pip3 install --user --upgrade pip

USER userdev
WORKDIR /home/userdev

CMD ["uname -a"]

```
```
docker build -t customName:latest .
docker run -i -t customName /bin/bash
```

#### Example for ROS2
This example creates a user called userdev

```
FROM bionic/arm64

###=====INFO === ##
#   ... the ros2 link must be updated if changed ....
###===================================================

#USER userdev
#WORKDIR /home/userdev

#====== INSTALL wiringPi ====
RUN pip3 install wiringpi && \
    pip3 install -U pip setuptools && \
    pip3 install libusb1 enum34 psutil

#====== PRE INSTALL ROS 2 ====
RUN export CHOOSE_ROS_DISTRO=eloquent && \
    sudo apt update && \
    sudo apt install -y wget curl gnupg2 lsb-release lsb-core && \
    sudo locale-gen en_US en_US.UTF-8 && \
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    sudo apt update && sudo apt install curl gnupg2 lsb-release && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - && \
    sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    sudo apt update


RUN sudo apt install ros-$CHOOSE_ROS_DISTRO-ros-base && \
    echo "source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash" >> ~/.bashrc


CMD ["uname -a"]
```

BTW.: if docker builds more then one image use the
```
docker image prune
```
which deletes all dangling images




#### From Source (didn't realy work for me, but could be that i never used it with docker run --rm --privileged multiarch/qemu-user-static --reset -p yes)

install open source machine emulator and virtualizer Qemu
via Github source code. (https://github.com/qemu/qemu.git)
```
git clone git://git.qemu.org/qemu.git
cd qemu
```
under default-configs/ the config targets can be found (like arm-linux-user)
```
./configure --target-list=aarch64-linux-user --static
make
```

Please make sure that the qemu-aarch64-static binary is under /usr/bin/ directory of your system
(for different architecturs use the look Up on https://wiki.gentoo.org/wiki/Embedded_Handbook/General/Compiling_with_qemu_user_chroot)

In my case
```
mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
echo ':aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/bin/qemu-aarch64:' > /proc/sys/fs/binfmt_misc/register
```
(ps can be also be take from "update-binfmts --display" but not sure how)



2. Copy qemu-arm-static to Your Working Directory
You need a copy of qemu-arm-static in your working directory for further modification.
cp /usr/bin/qemu-arm-static /your/working/dir
(or qemu-aarch64-static)
3. Modify the Dockerfile
Add this line of code, which makes a copy of qemu-arm-static binary to your docker image, below the "FROM" instruction in you Dockerfile.
COPY qemu-arm-static /usr/bin/qemu-arm-static
4. Build Docker Image with the Modified Dockerfile
Now build your docker image with the modified Dockerfile.
docker build -t your-image-name .



### Get docker img online (easiest)
online
https://hub.docker.com/r/aarch64/ubuntu

### Get docker img localy
for that the easiest way to go is to get the parent imag from the target system


Info: bionic can be changed to a different name "distro name"
```
sudo debootstrap bionic bionic > /dev/null
sudo tar -cvzf bionic.tgz bionic/ > log.txt
```
I always had an issue with apt list
to prevent this copy /etc/apt/sources.list from local pc into the bionic/etc/apt/sources.list file
(PS.: only the essential links a needed for a clean setup)
```
sudo chown sausy:sausy bionic.tgz
```
copy .tar file to desired target and
```
sudo docker import bionic.tgz
```
to print out the lsb data of the container img
```
docker run bionic cat /etc/lsb-release
```
This should print out infos

### Get docker img via .img file
Install kpartx to creat a loopback device at a specific location
```
sudo apt install kpartx
```
First creat a project folder (dockerimgAarch64Rpi) with two sub folders
```
mkdir dockerimgAarch64Rpi
mkdir dockerimgAarch64Rpi/rootfs
mkdir dockerimgAarch64Rpi/unquashfs
```
mount the img to rootfs
```
sudo kpartx -av ubuntu-18.04.4-preinstalled-server-arm64+raspi3.img
>>add map loop18p1 (253:0): 0 524288 linear 7:18 2048
>>add map loop18p2 (253:1): 0 4599640 linear 7:18 526336
```
wich creates a loopback at
/dev/mapper/loop18p1
(some cases at /dev/loop...)
```
sudo mount -o loop /dev/mapper/loop18p1 dockerimgAarch64Rpi/rootfs
```

search
```
find dockerimgAarch64Rpi/. -type f | grep filesystem.squashfs
```
if there is no squashfs file then
```
sudo cp -r rootfs nameofnewimg
#e.g. nameofnewimg=rpiaarch64
sudo cp -r rootfs rpiaarch64
```
else
```
sudo unsquashfs -f -d unsquashfs/rootfs/<where u found it>
sudo cp -r unsquashfs nameofnewimg

#e.g. nameofnewimg=rpiaarch64
sudo cp -r unsquashfs rpiaarch64
```

and finaly compress it
```
sudo tar -cvzf rpiaarch64.tgz nameofnewimg/ > log.txt
```

I always had an issue with apt list
to prevent this copy /etc/apt/sources.list from local pc into the bionic/etc/apt/sources.list file
(PS.: only the essential links a needed for a clean setup)
```
sudo chown sausy:sausy rpiaarch64.tgz
```
copy .tar file to desired target and
```
cat rpiaarch64.tgz | docker import - rpiaarch64:new
```
to print out the lsb data of the container img
```
docker run rpiaarch64 cat /etc/lsb-release
```
This should print out infos


### Simple commands
(ps.: apt prints error but works ... with apt-get it works without error)
```
docker run bionic apt-get update
```
### change to docker commandline
```
docker run -i -t bionic /bin/bash
```

now you should check if apt list is empty (or has only one entry) [mentioed bevor]
```
cat /etc/apt/sources.list
```
if yes just fucking copy your /etc/apt/sources.list from your original system

Then run
```
apt update
apt upgrade
```
If you are asked which encoding to use on the console
take utf-8

```
apt install build-essential autoconf libtool cmake pkg-config git python3-dev nano vim curl
```

Test it

mkdir -p /home/project/firsttest/
cd /home/project/firsttest/
nano main.c

```
#include<stdio.h>

int main() {
	printf("Hello World\n");
	return 0;
}
```
compile
```
gcc main.c -o test
./test
```

### using dockerfile
To build an image from a Dockerfile this recently created parent img can be used.
create in your Projectfolder a file called
"Dockerfile"
```
FROM bionic:latest
WORKDIR /usr/src/app
RUN apt-get install cowsay
```

### make img file available
docker account needed
docker login --username usern --password asdf123


first find docker id
```
docker ps
```
and commit
```
docker commit c16378f943fe bionic
docker tag bionic:latest ubuntu18_default:latest

```


## Download Crosstool-ng ..Harcore shit not funny
https://github.com/crosstool-ng/crosstool-ng.git

```
sudo apt install bison cvs flex gperf texinfo automake libtool
git clone https://github.com/crosstool-ng/crosstool-ng.git
cd crosstool-ng
mkdir -p ~/.local/share/crosstool-ng
./bootstrap
./configure --prefix=$HOME/.local/share/crosstool-ng
```

!!!!!! unset  LD_LIBRARY_PATH
```
unset LD_LIBRARY_PATH
```

```
make
make install
export PATH=$PATH:$HOME/.local/share/crosstool-ng/bin/
```

### create toolchain for RaspberryPi
```
mkdir -p ~/Projects/crosscompile/RaspberryPi/staging
cd ~/Projects/crosscompile/RaspberryPi/staging
ct-ng  menuconfig
```
>>“Paths and misc options” >> Enable the option “Try features marked as EXPERIMENTAL”
>>“Paths and misc options” >> *PATHS*  ... Prefix Directory (NEW) >> change to ${HOME}/.local/x-tools/${CT_TARGET}

>> exit
>> Target options >> Target Architectur >> Arm
>> Target options >> Endianness: set to Little endian and
>> Target options >> Bitness 64-bit

to enable C++11
>> Target options >> Architecture level >> armv6


>> exit
>> Operating System >> Target OS >> linux

>> exit
>> Binary utilities >> binutils version”>> most recent one

>> exit
>> C compiler >> enable C++

>> exit
>> C Libary >> set lib to

>> exit

```
ct-ng build
#if it fails ...
unset LD_LIBRARY_PATH
```
And don't forget to tell you system where to find everything
export PATH=$PATH:$HOME/.local/x-tools/arm-unknown-linux-gnueabi/bin

### test with comandline compil e
arm-unknown-linux-gnueabi-c++ HelloWorld.cpp -o hiho

If an error like "-bash: ./hiho: No such file or directory"
pops up when executing the programm on rpi

```
ldd hiho
```
might output
not a dynamic executable


### with CMake

after sucessfull build create a file named
Toolchain-RaspberryPi.cmake
(This file can be put inside the project folder or somewhere else)

```
# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

SET(UNKNOWN_LINUX_NAME arm-unknown-linux-gnueabi)

# specify the cross compiler
SET(CMAKE_C_COMPILER
$ENV{HOME}/.local/x-tools/${UNKNOWN_LINUX_NAME}/bin/${UNKNOWN_LINUX_NAME}-gcc)

SET(CMAKE_CXX_COMPILER
$ENV{HOME}/.local/x-tools/${UNKNOWN_LINUX_NAME}/bin/${UNKNOWN_LINUX_NAME}-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH
$ENV{HOME}/.local/x-tools/${UNKNOWN_LINUX_NAME})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
```

```
mdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../Toolchain-RaspberryPi.cmake ../.
```

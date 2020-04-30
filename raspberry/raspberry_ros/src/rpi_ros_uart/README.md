The UART interface is shared with the bluetooth interface

PIN 14/15
|x   |   5V  |
|x   |   5V  |
|x   |   GND |
|x   |   TX  |
|GND |   RX  |
......

$ raspberry-config
under interfaces >> serial >> disable bluetooth

$ sudo nano /boot/config.txt
add the folowing lines at the end

dtoverlay=pi3-disable-bt
dtoverlay=pi3-miniuart-bt


For CMakeList only
-lwiringPi needs to be added 
target_link_libraries( rpi_ros_uart -lwiringPi -lpthread -lrt -lm ${catkin_LIBRARIES})

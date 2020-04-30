#include <stdio.h>
#include <string.h>
#include <ros/ros.h>
#include "std_msgs/String.h"

//#define LED_PIN 0 // change pin number here

int fd ;

void ros_to_uart_bridge(const std_msgs::String::ConstPtr& msg);

int main (int argc, char **argv)
{
  int count ;
  unsigned int nextTime ;
  char ch[100];

  //pinMode(LED_PIN, OUTPUT);
  //ROS_INFO("GPIO has been set as OUTPUT.");

  ros::init(argc, argv, "test_wiringpi_ros");
  ros::NodeHandle nh;
  //wiringPiSetupGpio();
  ros::Publisher chatter_pub = nh.advertise<std_msgs::String>("/roboy/hand/data", 1000);
  ros::Subscriber sub = nh.subscribe("/roboy/hand/gesture", 1000, ros_to_uart_bridge);

  ros::Rate loop_rate(10);

  //serialPuts(fd,"\nhello\n");
  //serialPrintf(fd,ch);      // write uninitialized string to /dev/ttyAMA0
  //printf ("%s", ch) ;



  while (ros::ok())
  {
    std_msgs::String msg;
    std::stringstream ss;

    ss << "Hello world";

    msg.data = ss.str();
    chatter_pub.publish(msg);

    ros::spinOnce();
    loop_rate.sleep();
  }
return 0;
}

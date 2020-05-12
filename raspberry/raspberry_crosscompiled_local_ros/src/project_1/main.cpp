#include <stdio.h>
#include <string.h>
#include <ros/ros.h>
#include "std_msgs/String.h"

//#define LED_PIN 0 // change pin number here

int fd ;

void sub_func(const std_msgs::String::ConstPtr& msg);

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
  ros::Publisher pub_inst = nh.advertise<std_msgs::String>("/test/topic1", 1000);
  ros::Subscriber sub_inst = nh.subscribe("/test/topic1", 1000, sub_func);

  ros::Rate loop_rate(10);


  while (ros::ok())
  {
    std_msgs::String msg;
    std::stringstream ss;

    ss << "Hello world";

    msg.data = ss.str();
    pub_inst.publish(msg);

    ros::spinOnce();
    loop_rate.sleep();
  }
return 0;
}

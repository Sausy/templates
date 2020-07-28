#include <stdio.h>
#include <string.h>
#include <ros/ros.h>
#include <std_msgs/String.h>

#include <stearing.hpp>

//#define LED_PIN 0 // change pin number here

int fd ;

void common_sub_routin(const std_msgs::String::ConstPtr& msg){
  std::cout<<"\ncommon sub: " << msg->data;
}

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
  ros::Publisher debug_pub = nh.advertise<std_msgs::String>("/debug/statusRPI", 1000);
  ros::Subscriber debug_sub = nh.subscribe("/debug/rpi_common_sub", 1000, common_sub_routin);

  ros::Rate loop_rate(10);

  //serialPuts(fd,"\nhello\n");
  //serialPrintf(fd,ch);      // write uninitialized string to /dev/ttyAMA0
  //printf ("%s", ch) ;

  stearing stearing;


  while (ros::ok())
  {
    std_msgs::String msg;
    std::stringstream ss;

    ss << "Hello world";

    msg.data = ss.str();
    debug_pub.publish(msg);

    ros::spinOnce();
    loop_rate.sleep();
  }
return 0;
}

#include <stdio.h>
#include <string.h>
#include <ros/ros.h>
#include "std_msgs/String.h"
#include <wiringPi.h>
#include <wiringSerial.h>

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

  if ((fd = serialOpen ("/dev/ttyAMA0", 9600 )) < 0)
  {
    fprintf (stderr, "Unable to open serial device: %s\n", strerror (errno)) ;
    return 1 ;
  }

  if (wiringPiSetup () == -1)
  {
    fprintf (stdout, "Unable to start wiringPi: %s\n", strerror (errno)) ;
    return 1 ;
  }

  nextTime = millis () + 300 ;


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

    if(serialDataAvail(fd)){
      ss << "Serial rdy:[yes] " << serialGetchar (fd);
      //fflush (stdout) ;
    }else{
      ss << "Serial rdy:[no]";
    }

    msg.data = ss.str();
    chatter_pub.publish(msg);

    ros::spinOnce();
    loop_rate.sleep();

  }
return 0;
}

void ros_to_uart_bridge(const std_msgs::String::ConstPtr& msg){
  std::stringstream ss;
  std::string s;
  ss << msg->data.c_str() << "\n";
  s = ss.str();
  const char* buffer_data = s.c_str();

  ROS_INFO("I heard: [%s]", buffer_data);
  serialPuts(fd,buffer_data);
}


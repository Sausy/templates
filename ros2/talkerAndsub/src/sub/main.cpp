#include <stdlib.h>
#include <iostream>
#include <sstream>
/*#include <pb_encode.h>
#include <pb_decode.h>*/

#include <string>
#include <vector>
#include <atomic>


//#include <ros/ros.h>
#include "rclcpp/rclcpp.hpp"
//#include <ros/package.h>
#include "std_msgs/msg/string.hpp"

//#include <udpInterface.hpp>
//#include "LUT/lut.h"



// Different Ports for diverent Signals from the ESP32
const int32_t  sensorPort   = 8000; // will be received from host
const int32_t  commandPort  = 4210;
const int32_t  logginPort   = 8002;  // will be received from host
const int32_t  configPort   = 8001;
const int32_t  imuPort   = 0; // will be received from host

rclcpp::Node::SharedPtr g_node = nullptr;

void sub_func(const std_msgs::msg::String::SharedPtr msg){
  printf("pintf %s \n", msg->data.c_str());
}

int main(int argc, char *argv[])
{

  /*std::cout << "\nstart UDP Interface ... ";
  udpInterface *udp = new udpInterface("192.168.0.31");//TODO: set local ip automatically
  udp->initClientSocket("192.168.0.30","4210"); //IP of client in this case a esp32
  (void)udp->initServerSocket("8000");

  std::thread thread1 = udp->member1Thread(logginPort,sensorPort,imuPort);
  std::thread thread2 = udp->member2Thread();*/

  std::cout << "\nstart ROS2";

  std_flush();



  //init ros
  /*if (!ros::isInitialized()){
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "lighthouse2ToRosMainFrame");
  }
  ros::NodeHandle nh;
  ros::Rate loop_rate(10);*/

  rclcpp::init(argc, argv);
  //auto node = rclcpp::Node::make_shared("simplesub");
  g_node = rclcpp::Node::make_shared("simplesub");

  //auto chatter_pub = node->create_publisher<std_msgs::msg::String>("chatter", 1000);
  auto sub_handler = g_node->create_subscription<std_msgs::msg::String>("chatter", 10, sub_func);

  rclcpp::Rate loop_rate(10);
  int count = 0;

  //ros::Subscriber sub_handler = nh.subscribe("/test/path2", 1, sub_callback);


  while (rclcpp::ok())
  {
    /*
    std_msgs::String msg;
    std::stringstream ss;
    ss << "Hello world";
    msg.data = ss.str();
    pub_handler.publish(msg);*/

    //std_msgs::String msg;

    //basic example talker
    /*
    std_msgs::msg::String msg;
    std::stringstream ss;
    ss << "Hello world";
    msg.data = ss.str();

    chatter_pub->publish(msg);*/



    //ros::spinOnce();
    rclcpp::spin_some(g_node);
    loop_rate.sleep();

  }


  //thread1.join();
  //thread2.join();

  printf("This Example shows how to make two threds for function in a class\n" );

  return 0;

}

#include <ros/ros.h>
#include <stdio.h>
#include <string.h>

#include "std_msgs/String.h"

#include <example_class.hpp>

using namespace std;

void sub_callback(const std_msgs::String::ConstPtr& msg){
    printf("%s", msg->data.c_str());
}

int main(int argc, char **argv){
  cout << "start control";

  //init ros
  if (!ros::isInitialized()){
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "uniq_node_id");
  }
  ros::NodeHandle nh;
  ros::Rate loop_rate(10);

  exClass exClass;

  ros::Publisher pub_handler = nh.advertise<std_msgs::String>("/test/path", 1);
  ros::Subscriber sub_handler = nh.subscribe("/test/path2", 1, sub_callback);


  while (ros::ok())
  {
    std_msgs::String msg;
    std::stringstream ss;

    ss << "Hello world";

    msg.data = ss.str();
    pub_handler.publish(msg);

    ros::spinOnce();
    loop_rate.sleep();

  }

  return 0;
}

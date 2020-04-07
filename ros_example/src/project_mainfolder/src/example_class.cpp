#include <example_class.hpp>

exClass::exClass(){

  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "example_class_node");
  }
  nh = ros::NodeHandlePtr(new ros::NodeHandle);

  ROS_INFO("init[STARTED]...example_class");


  ROS_INFO("init[DONE]...example_class");
}

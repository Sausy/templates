#include <stearing.hpp>

stearing::stearing():
  horizontal(0),
  vertical(1)
{

  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "stearing");
  }
  nh = ros::NodeHandlePtr(new ros::NodeHandle);

  nh->param("axis_linear", linear_, linear_);
  nh->param("axis_angular", angular_, angular_);
  nh->param("scale_angular", a_scale_, a_scale_);
  nh->param("scale_linear", l_scale_, l_scale_);


  //joy_sub = nh->subscribe<sensor_msgs::Joy>("/debug/joystick", 10, &stearing::getInputViaJoystick, this);
  joy_sub = nh->subscribe<sensor_msgs::Joy>("/joy", 10, &stearing::getInputViaJoystick, this);


  ROS_INFO("init[STARTED]...stearing");


  ROS_INFO("init[DONE]...stearing");
}

void stearing::getInputViaJoystick(const sensor_msgs::Joy::ConstPtr& joy){
  std::cout <<"\nAxis0: "<< joy->axes[horizontal];
  std::cout <<"\nAxis1: "<< joy->axes[vertical];
  std::cout <<"\nAxis2: "<< joy->axes[2];
  std::cout <<"\nAxis2: "<< joy->axes[3];
  std::cout <<"\nButton0: "<< joy->buttons[0];
  std::cout <<"\nButton1: "<< joy->buttons[1];
  std::cout <<"\nButton2: "<< joy->buttons[2];
}

#pragma once

#include <ros/ros.h>
#include <sensor_msgs/Joy.h>

using namespace std;

class stearing
{
  public:
    stearing();

  private:
    ros::NodeHandlePtr  nh;
    ros::Subscriber joy_sub;

    void getInputViaJoystick(const sensor_msgs::Joy::ConstPtr& joy);

    int horizontal, vertical;
    double l_scale_, a_scale_;

};

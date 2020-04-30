#pragma once

#include <ros/ros.h>

using namespace std;

class exClass
{
  public:
    exClass();

  private:
    ros::NodeHandlePtr  nh;
    ros::Publisher pubHandl_Sensor;
};

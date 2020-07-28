#pragma once

#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <wiringPi.h>
#include <softPwm.h>

using namespace std;

//====PIN config=====
#define PIN_EN_MOTOR 25 // .. pin 31 look it up via gpio readall


#define PWM_PIN_0 24 // .. pin 32 look it up via gpio readall
#define PWM_PIN_1 23 // .. pin 33 look it up via gpio readall

//==== PWM DEFINES ====
#define PWM_RESOLUTION 1024
#define PWM_FACTOR (PWM_RESOLUTION/100.0)

//===== ====
#define STEERING_PREVENT 0
#define STEERING_ALLOW 1

#define STEERING_RIGHT 0
#define STEERING_LEFT 1
#define STEERING_HOLD 2
#define STEERING_RELEASE 3


//====== define if softwarePWM is wanted
#define EN_SOFT_PWM

class stearing
{
  public:
    stearing();
    //void Motor_cfg();
    //Motor speed shall be in procent
    bool Motor_move(uint8_t steering_direction, float motor_speed); //TODO: read in endpoint sensors


  private:
    ros::NodeHandlePtr  nh;
    ros::Subscriber joy_sub;

    void getInputViaJoystick(const sensor_msgs::Joy::ConstPtr& joy);

    int horizontal, vertical;
    double l_scale_, a_scale_;


};

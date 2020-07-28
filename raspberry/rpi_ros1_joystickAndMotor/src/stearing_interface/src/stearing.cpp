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

  /*
  nh->param("axis_linear", linear_, linear_);
  nh->param("axis_angular", angular_, angular_);
  nh->param("scale_angular", a_scale_, a_scale_);
  nh->param("scale_linear", l_scale_, l_scale_);*/


  //joy_sub = nh->subscribe<sensor_msgs::Joy>("/debug/joystick", 10, &stearing::getInputViaJoystick, this);
  joy_sub = nh->subscribe<sensor_msgs::Joy>("/joy", 10, &stearing::getInputViaJoystick, this);


  ROS_INFO("init[STARTED]...stearing");


  ROS_INFO("init[DONE]...stearing");

  //============= [Checking Wiring PI] ==============
  if (wiringPiSetup() == -1){ //wiringPiSetupSys
    ROS_ERROR("WiringPi failed");
  }else{

    pinMode(PIN_EN_MOTOR, OUTPUT);
    digitalWrite (PIN_EN_MOTOR, STEERING_PREVENT);

    //pinMode(PWM_PIN_0, OUTPUT);

#ifndef EN_SOFT_PWM
    pinMode (PWM_PIN_0, PWM_OUTPUT);
    pinMode (PWM_PIN_1, PWM_OUTPUT);
    pwmWrite (PWM_PIN_1, 200);

    pwmSetRange (PWM_RESOLUTION);
#else
    if(softPwmCreate (PWM_PIN_0, 0, PWM_RESOLUTION) != 0)
      ROS_WARN("softPwmCreate failed");
    if(softPwmCreate (PWM_PIN_1, 0, PWM_RESOLUTION) != 0)
      ROS_WARN("softPwmCreate failed");
#endif


  }
  ROS_INFO("WiringPi SetupDone");
  //softPwmWrite (PWM_PIN_1, 500) ;
  //pwmSetMode (int mode) ;
  //pwmSetClock (int divisor) ;

}

void stearing::getInputViaJoystick(const sensor_msgs::Joy::ConstPtr& joy){
  float speed = 0.0;

  std::cout <<"\nSteering: "<< joy->axes[horizontal];
  std::cout <<"\nThrottle: "<< joy->axes[vertical];

  //std::cout <<"\nAxis2: "<< joy->axes[2];
  //std::cout <<"\nAxis2: "<< joy->axes[3];
  //std::cout <<"\nButton0: "<< joy->buttons[0];
  //std::cout <<"\nButton1: "<< joy->buttons[1];
  //std::cout <<"\nButton2: "<< joy->buttons[2];


  if (joy->axes[horizontal] > 0.2){
    speed = 100.0 * joy->axes[horizontal];
    if(!Motor_move(STEERING_RIGHT, speed))
      std::cout <<"\nSteering ERROR ... LEFT";
  }else if(joy->axes[horizontal] < 0.2){
    speed = -100.0 * joy->axes[horizontal];
    if(!Motor_move(STEERING_LEFT, speed))
      std::cout <<"\nSteering ERROR ... LEFT";
  }else{
    (void)Motor_move(STEERING_RELEASE, speed);
  }
}



#ifndef EN_SOFT_PWM
bool stearing::Motor_move(uint8_t steering_direction, float motor_speed){
  //till everything is set disable motorBoard
  digitalWrite (PIN_EN_MOTOR, STEERING_PREVENT);

  //===TODO==
  //ADD endpoint switches

  uint32_t pwm_ratio = 0;

  //
  if(motor_speed <= 100.0){
    pwm_ratio = (uint32_t)(PWM_FACTOR * motor_speed);
  }else{
    ROS_WARN("Motor speed has to be between 0-100 ...[WRONG VALUE in FUNC bool Motor_move(*)]");
  }

  switch (steering_direction) {
    case STEERING_LEFT:
      pwmWrite (PWM_PIN_0, 0);
      pwmWrite (PWM_PIN_1, pwm_ratio);
      break;
    case STEERING_RIGHT:
      pwmWrite (PWM_PIN_1, 0);
      pwmWrite (PWM_PIN_0, pwm_ratio);
      break;
    case STEERING_RELEASE:
      pwmWrite (PWM_PIN_1, 0);
      pwmWrite (PWM_PIN_0, 0);
      break;
    case STEERING_HOLD:
      ROS_WARN("Steering hold is not implemented yet");
      break;
    default :
      return false;
      break;
  }


  digitalWrite (PIN_EN_MOTOR, STEERING_ALLOW);
  return true;
}
#else

bool stearing::Motor_move(uint8_t steering_direction, float motor_speed){
  //till everything is set disable motorBoard
  digitalWrite (PIN_EN_MOTOR, STEERING_PREVENT);

  //===TODO==
  //ADD endpoint switches

  uint32_t pwm_ratio = 0;

  //
  if(motor_speed <= 100.0){
    pwm_ratio = (uint32_t)(PWM_FACTOR * motor_speed);
  }else{
    ROS_WARN("Motor speed has to be between 0-100 ...[WRONG VALUE in FUNC bool Motor_move(*)]");
  }

  switch (steering_direction) {
    case STEERING_LEFT:
      softPwmWrite (PWM_PIN_0, 0);
      softPwmWrite (PWM_PIN_1, pwm_ratio);
      break;
    case STEERING_RIGHT:
      softPwmWrite (PWM_PIN_1, 0);
      softPwmWrite (PWM_PIN_0, pwm_ratio);
      break;
    case STEERING_RELEASE:
      softPwmWrite (PWM_PIN_1, 0);
      softPwmWrite (PWM_PIN_0, 0);
      break;
    case STEERING_HOLD:
      ROS_WARN("Steering hold is not implemented yet");
      break;
    default :
      return false;
      break;
  }


  digitalWrite (PIN_EN_MOTOR, STEERING_ALLOW);
  return true;
}

#endif

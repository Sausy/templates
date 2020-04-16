#include <stdlib.h>
#include <iostream>
#include <pb_encode.h>
#include <pb_decode.h>

#include <string>
#include <vector>
#include <atomic>

/*
#include <sys/types.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <memory.h>
#include <ifaddrs.h>
#include <net/if.h>
#include <errno.h>
*/

#include <udpInterface.hpp>


// Different Ports for diverent Signals from the ESP32
const int32_t  sensorPort   = 8000; // will be received from host
const int32_t  commandPort  = 4210;
const int32_t  logginPort   = 8002;  // will be received from host
const int32_t  configPort   = 8001;
const int32_t  imuPort   = 0; // will be received from host




int main(int argc, char *argv[])
{

  udpInterface *udp = new udpInterface("192.168.0.31");//TODO: set local ip automatically
  udp->initClientSocket("192.168.0.30","4210"); //IP of client in this case a esp32
  (void)udp->initServerSocket("8000");

  std::thread thread1 = udp->member1Thread(logginPort,sensorPort,imuPort);
  std::thread thread2 = udp->member2Thread();

  int j = 0;
  char escInput = 0;
  do{
    std::cin >> escInput;
  }while (escInput == 0);


  thread1.join();
  thread2.join();

  printf("This Example shows how to make two threds for function in a class\n" );

  return 0;

}

#ifndef _UDP_DATA_SEND_HPP_
#define _UDP_DATA_SEND_HPP_

#include <stdlib.h>
#include <iostream>



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
#include <stdlib.h>
#include <iostream>



int resolvehelper(const char* hostname, int family, const char* service, sockaddr_storage* pAddr);
void initClientSocket();
int initServerSocket(int PORT);
void sendData(const uint8_t * buffer, uint16_t buffer_length);
void receiveData();

void sendConfigObject (uint8_t ipAddr_firstByte, uint8_t ipAddr_seconByte, uint8_t ipAddr_thirdByte, uint8_t ipAddr_fourthByte, int32_t logginPort_l, int32_t sensorPort_l, int32_t imuPort_l);




#endif

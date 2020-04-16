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
void initSocket();
void sendData(char * msg_);



#endif

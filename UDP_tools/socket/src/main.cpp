#include <stdlib.h>
#include <iostream>

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

#include <udpEsp32Interface.hpp>


int main(int argc, char *argv[])
{
    initSocket();

    for(uint32_t i = 0; i < 100000; i++){
      sendData("new");
    }

    return 0;

}

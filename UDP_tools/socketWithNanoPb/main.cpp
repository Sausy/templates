#include <stdlib.h>
#include <iostream>
#include <pb_encode.h>
#include <pb_decode.h>

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
#include <protoLighthouse.h>
#include <lighthouse.pb.h>

int32_t  sensorPort   = 8000; // will be received from host
int32_t  commandPort  = 4210;
int32_t  logginPort   = 8002;  // will be received from host
int32_t  configPort   = 8001;
int32_t  imuPort   = 0; // will be received from host

void config_device(){

    sendConfigObject(192,168,0,31,logginPort,sensorPort,imuPort);
}

void receiveSensorData(){
    pb_byte_t buffer[512] = {0};
    size_t msg_len;

    PROTO_LOVE pb;
}


int main(int argc, char *argv[])
{
    initClientSocket();
    config_device();

    if(!initServerSocket(sensorPort)){
      printf("Listener on port %d\n", sensorPort);
    }
    receiveData();

    /*
    uint8_t buffer[128];
    for(uint32_t i = 0; i < 100000; i++){
      sendData("new",3);
    }*/

    return 0;

}

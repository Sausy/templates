#include <udpEsp32Interface.hpp>


#include <pb_encode.h>
#include <pb_decode.h>


#include "lighthouse.pb.h"
#include "protoLighthouse.h"


const int32_t  sensorPort   = 8000; // will be received from host
const int32_t  commandPort  = 4210;
const int32_t  logginPort   = 8002;  // will be received from host
const int32_t  configPort   = 8001;
const int32_t  imuPort   = 0; // will be received from host


static sockaddr_in SockAddr = {}; // zero-int, sin_port is 0, which picks a random port for bind.
static sockaddr_storage addrDest = {};
static int fd;

static sockaddr_in ClientSockAddr = {}; // zero-int, sin_port is 0, which picks a random port for bind.
static int ServerSock;

pb_byte_t mainBuffer[512] = {0};
size_t main_msg_len;

//=============================================================================
int resolvehelper(const char* hostname, int family, const char* service, sockaddr_storage* pAddr)
{
    int result;
    addrinfo* result_list = NULL;
    addrinfo hints = {};
    hints.ai_family = family;
    hints.ai_socktype = SOCK_DGRAM; // without this flag, getaddrinfo will return 3x the number of addresses (one for each socket type).
    result = getaddrinfo(hostname, service, &hints, &result_list);
    if (result == 0)
    {
        //ASSERT(result_list->ai_addrlen <= sizeof(sockaddr_in));
        memcpy(pAddr, result_list->ai_addr, result_list->ai_addrlen);
        freeaddrinfo(result_list);
    }

    return result;
}

//=============================================================================
void initClientSocket(){
  int result = 0;
  fd  = socket(AF_INET, SOCK_DGRAM, 0);

  char szIP[100];


  SockAddr.sin_family = AF_INET;
  result = bind(fd, (sockaddr*)&SockAddr, sizeof(SockAddr));
  if (result == -1)
  {
     int lasterror = errno;
     std::cout << "error: " << lasterror;
     exit(1);
  }



  result = resolvehelper("192.168.0.30", AF_INET, "4210", &addrDest);
  if (result != 0)
  {
     int lasterror = errno;
     std::cout << "error: " << lasterror;
     exit(1);
  }

  //const char* msg = "Jane Doe";
  //size_t msg_length = strlen(msg);

  //result = sendto(sock, msg, msg_length, 0, (sockaddr*)&addrDest, sizeof(addrDest));

  //std::cout << result << " bytes sent" << std::endl;
}

//=============================================================================
int initServerSocket(int PORT){

  int result = 0;

  char buffer[512] = {0};


  ServerSock = socket(AF_INET, SOCK_DGRAM, 0);


  if (ServerSock < 0) {
      printf("\nsocket");
      return 1;
  }

  u_int yes = 1;
  if (setsockopt(ServerSock, SOL_SOCKET, SO_REUSEADDR, (char*) &yes, sizeof(yes)) < 0){
     printf("\nReusing ADDR failed");
     return 1;
  }

  // set up destination address
  //

  //memset(&addr, 0, sizeof(addr));
  ClientSockAddr.sin_family = AF_INET;
  ClientSockAddr.sin_addr.s_addr = htonl(INADDR_ANY); // differs from sender
  ClientSockAddr.sin_port = htons(PORT);

  // bind to receive address
  //
  if (bind(ServerSock, (struct sockaddr*) &ClientSockAddr, sizeof(ClientSockAddr)) < 0) {
      printf("\nbind");
      return 1;
  }

  return 0;
}

void receiveData(){

      char msgbuf[512];
      socklen_t addrlen = sizeof(ClientSockAddr);

      int nbytes = recvfrom(
          ServerSock,
          msgbuf,
          512,
          0,
          (struct sockaddr *) &ClientSockAddr,
          &addrlen
      );
      if (nbytes < 0) {
          printf("\nrecvfrom");
          return;
      }
      msgbuf[nbytes] = '\0';
      //puts(msgbuf);
      //rx_data.push_back(msgbuf);
      //*rx_data = msgbuf;
      //rx_data++;
      printf("RX-DATA=:%s", msgbuf);


}

//=============================================================================
void sendData(const uint8_t * buffer, uint16_t buffer_length){

  int result  = sendto(sock, buffer, buffer_length, 0, (sockaddr*)&addrDest, sizeof(addrDest));

}

//=============================================================================
void sendConfigObject (uint8_t ipAddr_firstByte, uint8_t ipAddr_seconByte, uint8_t ipAddr_thirdByte, uint8_t ipAddr_fourthByte, int32_t logginPort_l, int32_t sensorPort_l, int32_t imuPort_l){

  PROTO_LOVE pb;
  uint32_t ip_addrese = (ipAddr_fourthByte<<24) | (ipAddr_thirdByte<<16) | (ipAddr_seconByte<<8) | (ipAddr_firstByte);

  pb_byte_t buffer[512] = {0};
  size_t msg_len;

  if(pb.ecode_config_Proto(ip_addrese,  logginPort_l, sensorPort_l, imuPort_l, buffer, msg_len )){
      printf("Encoded");
  }

  (void)sendData(buffer,msg_len);

}

#include <udpEsp32Interface.hpp>


uint16_t  sensorPort   = 8000; // will be received from host
uint16_t  commandPort  = 4210;
uint16_t  logginPort   = 8002;  // will be received from host
uint16_t  configPort   = 8001;
uint16_t  imuPort   = 0; // will be received from host


static sockaddr_in addrListen = {}; // zero-int, sin_port is 0, which picks a random port for bind.
static sockaddr_storage addrDest = {};
static int sock;

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

void initSocket(){
  int result = 0;
  sock  = socket(AF_INET, SOCK_DGRAM, 0);

  char szIP[100];


  addrListen.sin_family = AF_INET;
  result = bind(sock, (sockaddr*)&addrListen, sizeof(addrListen));
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

  const char* msg = "Jane Doe";
  size_t msg_length = strlen(msg);

  result = sendto(sock, msg, msg_length, 0, (sockaddr*)&addrDest, sizeof(addrDest));

  std::cout << result << " bytes sent" << std::endl;
}

void sendData(char * msg_){
  const char* msg = "Jane Doe";
  size_t msg_length = strlen(msg);

  int result  = sendto(sock, msg, msg_length, 0, (sockaddr*)&addrDest, sizeof(addrDest));
}

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

#include <testClass.hpp>



int main(int argc, char *argv[])
{

  tetsClass *tC = new tetsClass(20);

  std::thread thread1 = tC->member1Thread();
  std::thread thread2 = tC->member2Thread("hello", 100);

  int j = 0;

  do{
    j++;
  }while (j<10000);


  thread1.join();
  thread2.join();

  printf("This Example shows how to make two threds for function in a class\n", );

  return 0;

}

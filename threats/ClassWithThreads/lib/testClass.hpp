#ifndef PROTOLIGHTHOUSE_H
#define PROTOLIGHTHOUSE_H

//#define System_IS_ESP
/*
#ifdef System_IS_ESP
  #include "logging.h"
  #include "lighthouse.pb.h"
  #include "helper_3dmath.h"
  #include "pb.h"
  #include "pb_encode.h"
  #include "pb_decode.h"
#endif
#ifndef System_IS_ESP
  #include <cmath>
  #include <stdlib.h>
  #include <iostream>
  #include <lighthouse.pb.h>
  #include <pb_encode.h>
  #include <pb_decode.h>
#endif
*/


#include <thread>
#include <iostream>


class tetsClass {
   public:
      tetsClass(uint8_t testVar_);
      void function1();
      void function2(const char *arg1, unsigned arg2);

      std::thread member1Thread();
      std::thread member2Thread(const char *arg1, unsigned arg2);

      uint8_t testVar;

};


#endif

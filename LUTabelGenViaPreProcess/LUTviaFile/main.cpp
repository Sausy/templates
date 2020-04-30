# include <stdint.h>
# include <iostream>
//# include <cstdint>
//# include <conio.h>
#include <stdlib.h>
#include <sstream>
#include <string>


static uint32_t const polyPool[32] = {0x1D258, 0x17E04, 0x1FF6B, 0x13F67, 0x1B9EE, 0x198D1, 0x178C7, 0x18A55, 0x15777, 0x1D911, 0x15769, 0x1991F, 0x12BD0, 0x1CF73, 0x1365D, 0x197F5, 0x194A0, 0x1B279, 0x13A34, 0x1AE41, 0x180D4, 0x17891, 0x12E64, 0x17C72, 0x19C6D, 0x13F32, 0x1AE14, 0x14E76, 0x13C97, 0x130CB, 0x13750, 0x1CB8D};
#define LFSR_SIZE 17
#define LFSR_MAX_ITERATION (2^LFSR_SIZE-1)

//#define PRE_BIT(i)

static uint32_t const preCalcLut[] = {
    //#include "LUT/testLUT.bin"
    #include "LUT/test_include.bin"
};


int main(int argc, char* argv[]){


  uint32_t data[2] = {0x1fe72,0x0bd25};
  uint32_t t1 = 0x0C552F;
  uint32_t t2 = 0x0C5808;
  std::stringstream ss;

  if(argc == 3){
    std::string s1 = argv[1];
    std::string s2 = argv[2];
    //printf("\nInitPoly %s, EndState %s\n", argv[1], argv[2]);

    data[0] = stoi(s1, 0, 16);
    data[1] = stoi(s2, 0, 16);

  }




  printf("\nPrecalcInput %d", preCalcLut[0]);
  printf("\nPrecalcInput %d", preCalcLut[1]);
  printf("\nPrecalcInput %d", preCalcLut[2]);
  printf("\nSize %d\n", (uint32_t)sizeof(preCalcLut)/4);






  return 0;
}

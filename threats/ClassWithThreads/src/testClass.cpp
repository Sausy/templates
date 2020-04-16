#include <testClass.hpp>

tetsClass::tetsClass(uint8_t testVar_){
  testVar = testVar_;
}

void tetsClass::function1() {
    for(uint8_t i = 0; i < 100; i++){
      std::cout << "i am member1" << testVar << std::endl;
    }
}
void tetsClass::function2(const char *arg1, unsigned arg2) {
    for(uint8_t i = 0; i < 100; i++){
      std::cout << "i am member2 and my first arg is (" << arg1 << ") and second arg is (" << arg2 << ")" << std::endl;
    }
}

std::thread tetsClass::member1Thread() {
    /*int i = 0;

    do{
      //std::thread([=] { function1(); });
      //function1();
      i++;
      std::thread([=] { function1(); });
      if(i>=100)
        break;

    }while (i<100);
*/
    //return std::thread([=] { function1(); });

    return std::thread(&tetsClass::function1, this);

    //return std::thread([=] { member1(); });
}
std::thread tetsClass::member2Thread(const char *arg1, unsigned arg2) {
      //return std::thread([=] { function2(arg1, arg2); });

      return std::thread(&tetsClass::function2, this, arg1, arg2);
}

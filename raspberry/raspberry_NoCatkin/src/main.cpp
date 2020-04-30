#include <wiringPi.h>

#define OUT_PIN 0

int main(void){
  wiringPiSetup();

  pinMode(OUT_PIN, OUTPUT);
  for(;;){
    digitalWrite(OUT_PIN, HIGH);
    delay(500);
    digitalWrite(OUT_PIN, LOW);
    delay(500);
  }
  return 0
}

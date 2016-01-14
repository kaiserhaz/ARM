#include "LPC210X.h"
int main()
{
/*  int i,j;
  question prépa
  GPIO_Init(0x0000FF00);
  for(i=0;i<1000000;i++){

    GPIO_Write(0x00000F00);
      for(j=0;j<3000;j++){

    }
  }
*/
  led_Init(0x0000FF00);
  GPIO_Write(0x00000100);
  //led_Init(0x00000F00);


   led_Blink();


  return 0;
}

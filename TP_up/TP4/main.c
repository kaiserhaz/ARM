#include "LPC210X.h"
#include "uart0.h"
#include "pwm.h"
#include "uart0.h"
int main()
{
  pwm_init();
  uart0_init();
//  uart0_putc('C');
  uart0_puts("Hello World !");

  while (1) { }
  return 0;
}

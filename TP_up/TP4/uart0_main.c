#include "LPC210X.h"

int main(void)
{
	char *s = "Bonjour tout le monde!";
	
	uart0_init();
	
	uart0_puts(s);
	
	return 0;
}
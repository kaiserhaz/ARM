#include "LPC210X.h"
#include <stdlib.h>
#include <stdio.h>
void uart0_init(){

	SCB_PLLCFG = 0x45 ; // P45 : pour avoir 60MHz, on multiplie par M=6 (cf P48)
	
	SCB_PLLFEED = 0xAA;	 // P46 : A correct feed sequence must be written to the PLLFEED register in order for changes to the PLLCON and PLLCFG registers to take effect
	SCB_PLLFEED = 0x55;
	
	SCB_PLLCON = 0x1; // P45 : rendre active la PLL
	SCB_PLLFEED = 0xAA;
	SCB_PLLFEED = 0x55;

        while(!(SCB_PLLSTAT && 0x400)); //When one, the PLL is locked onto the requested frequency.

	SCB_PLLCON = 0x3;	//P45 Table 13
	SCB_PLLFEED = 0xAA;
	SCB_PLLFEED = 0x55;
	
	SCB_VPBDIV = 0x1; // P52 Table 24 : mettre l'horloge Ã  la valeur de celle du processeur	


        PCB_PINSEL0 = 0x00000005; // Configuration des ports pour permettre la transmission et réception depuis les port P0.0 et P0.1 respectivement (voir pg. 78 du manuel)
	
	UART0_FCR = 0x07; // Reset des buffer de Tx et Rx (voir pg. 90 du manuel)
	
	UART0_LCR = 0x83; // Activation de l'accès aux latch diviseurs (voir pg. 91 du manuel)
	
	UART0_DLM = 0x01; // Configuration du générateur de taux de transmission. Pour cela, nous allons diviser pclk par 16x9600 pour obtenir la facteur de division
	UART0_DLL = 0x86; //  (voir pg. 87 du manuel)
	
	UART0_LCR = 0x03; // Configuration en mode 8 bits et désactivation de l'accès aux latch diviseurs (voir pg. 91 du manuel)

}

void uart0_putc(char c){
  /*char intChar;
  intChar = atoi(&c);
  UART0_THR = intChar;*/

  UART0_THR = (int)c; /* On affecte le caractère (en faisant un cast) dans le registre UART0_THR */
}

int transmitter0_empty(void){
  return ((UART0_LSR & 0x20)==0x20);
}

void uart0_puts(char *s){
 	int i=0; /* Compteur d'indice */
	
	while(*s) /* Tant que le transmetteur n'est pas vide, on transmet les caratères une par une */
	{
          if(transmitter0_empty()){
		uart0_putc(*s);
		//i++; /* Incrémentation du compteur pour parcourir la chaîne */
                *s++;
          }
	}
	
	uart0_putc('\0'); /* On met le caratère '\0' pour terminer la transmission */
}

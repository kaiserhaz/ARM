#include "LPC210X.h"

void uart0_init()
{
	/* Partie 1.2 : Initialisation */

	SCB_PLLCFG = 0x00000025; // Configuration de M = 6 et P = 2 pour fixer cclk = 60 MHz et Fcco = 240 MHz (voir pg. 45, 47, 48 du manuel)
	
	__disable_interrupt(); // Désactivation des interrupts (nécessaires pour la mise de séquence d'actionnement (voir pg. 46, 47 du manuel)
	
	SCB_PLLFEED = 0X000000AA; // Séquence d'actionnement pour sauvegarder les configs (voir pg. 46, 47 du manuel)
	SCB_PLLFEED = 0x00000055;
	
	__enable_interrupt(); // Réactivation des interrupts
	
	SCB_PLLCON = 0x00000001; // Activation du PLL (voir pg. 45 du manuel)

	__disable_interrupt();
	
	SCB_PLLFEED = 0X000000AA;
	SCB_PLLFEED = 0x00000055;
	
	__enable_interrupt();

	while((SCB_PLLSTAT && 0x00000400)!= 0x00000400) // Attente de la synchronisation du PLL avec la fréquence fixée (voir pg. 46 du manuel)
	
	SCB_PLLCON = 0x00000003; // Activation du PLL (voir pg. 45 du manuel)
	
	__disable_interrupt();
	
	SCB_PLLFEED = 0X000000AA;
	SCB_PLLFEED = 0x00000055;
	
	__enable_interrupt();
	
	SCB_VPBDIV = 0x00000001; // Synchronisation de pclk avec cclk (voir pg. 52 du manuel)
	
	/* Partie 1.3 : Configuration */
	
	PCB_PINSEL0 = 0x00000005; // Configuration des ports pour permettre la transmission et réception depuis les port P0.0 et P0.1 respectivement (voir pg. 78 du manuel)
	
	UART0_FCR = 0x07; // Reset des buffer de Tx et Rx (voir pg. 90 du manuel)
	
	UART0_LCR = 0x83; // Activation de l'accès aux latch diviseurs (voir pg. 91 du manuel)
	
	UART0_DLM = 0x01; // Configuration du générateur de taux de transmission. Pour cela, nous allons diviser pclk par 16x9600 pour obtenir la facteur de division
	UART0_DLL = 0x86; //  (voir pg. 87 du manuel)
	
	UART0_LCR = 0x03; // Configuration en mode 8 bits et désactivation de l'accès aux latch diviseurs (voir pg. 91 du manuel)
}

/* Partie 1.4 : Transmission */

/* Fonction uart0_putc qui permet de transmettre une caractère
 */

void uart0_putc(char c)
{
	UART0_THR = (int)c; /* On affecte le caractère (en faisant un cast) dans le registre UART0_THR */
}

/* Fonction transmitter_empty qui permet de vérifier si le registre UART0_THR est vide ou non
 */

int transmitter_empty(void)
{
	if(UART0_THR = 0x00); /* S'il n'y a rien dans UART0_THR, alors le transmetteur est vide */
		return 1;
	else
		return 0;
}

/* Fonction uart0_puts qui permet de transmettre une chaîne de caractères
 */

void uart0_puts(char *s)
{
	int i=0; /* Compteur d'indice */
	
	while(transmitter_empty() != 0) /* Tant que le transmetteur n'est pas vide, on transmet les caratères une par une */
	{
		uart0_putc(*(s+i));
		i++; /* Incrémentation du compteur pour parcourir la chaîne */
	}
	
	uart0_putc(NULL); /* On met le caratère NULL pour terminer la transmission */
}



























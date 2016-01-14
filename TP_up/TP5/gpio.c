#include "LPC210X.h"

/* gpio.c avec main.c */

/* ********Old File**********

void GPIO_Init(int config)
{
	PCB_PINSEL0 = 0x00000000;
	PCB_PINSEL1 = 0x00000000;
	GPIO_IODIR = config;
}

short GPIO_Read()
{
	return GPIO_IOPIN;
}

void GPIO_Write(int mot)
{
	GPIO_IOCLR = mot;
	GPIO_IOSET = mot;
}

void main(void)
{
	const int masque = 0x00004700;
	
	led_Init(masque);
	
	led_Blink();
}
*/

/* *********New File*********** */

/* Fonction GPIO_Init qui initialise le port parallel
 *  avec la configuration des LEDs à utiliser
 */

void GPIO_Init(int config)
{
	GPIO_IODIR = config; /* On charge la configuration des LEDs à utiliser */
}

/* Fonction GPIO_Read qui retourne l'état du registre GPIO_IOPIN
 */

short GPIO_Read()
{
	return GPIO_IOPIN;
}

/* Fonction GPIO_Write qui écrit la configuration dans le GPIO
 */
 
void GPIO_Write(int mot)
{
	GPIO_IOSET = 0x00000000;
	GPIO_IOCLR = mot;
}
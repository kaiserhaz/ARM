#include "LPC210X.h"

/*	Fonction qui permet de configurer le port parall�le au travers du registre
 *	GPIO_IODIR
 *	Selon le manuel, ce registre se situe � l'adresse 0xE0028008
 */
void GPIO_Init(int config){
	GPIO_IODIR = config;	/* 	On initialise le GPIO_DIR	*/
}

/*	Fonction qui renvoie la valeur du registre GPIO_IOPIN
 *	Selon le manuel, ce registre se situe � l'adresse 0xE0028000
 */
short GPIO_Read(){
	return GPIO_IOPIN;
}
/*	Fonction qui permet d'�crire l'�tat correspondant � mot dans le GPIO
 *	en utilisant les registres GPIO_IOSET et GPIO_IOCLR
 *	Selon le manuel, ces registres se trouvent respectivement aux adresses
 *	0xE0028004 et 0xE002800C
 */
void GPIO_Write(int mot){
    GPIO_IOSET = 0x0000FF00; /* on �teint toutes les leds */
    GPIO_IOCLR = mot;	/*	On allume chacune des leds correspondant au mot	*/
}

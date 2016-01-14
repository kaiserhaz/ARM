#include "LPC210X.h"
#include "gpio.h"
#include "led.h"

int main(void)
{
	/* Partie 1.2 * A mettre en commentaire pour la partie 1.3 */

	int led = 0x00000100; /* Variable de sélection de LED */
	int led_config = 0xFFFF0000; /* Configuration des LED à utiliser : tous les 8 LEDs correspondant aux ports P0.8 - P0.15 (voir pg. 78 du manuel) */
	
	led_Init(led_config); /* Initialisation de la configuration des LEDs */
	
	GPIO_Write(led); /* Séléction du premier LED */

	led_Shift_left(); /* Execution de la boucle de décalage gauche */

	/* Partie 1.3 */
	
	return 0;
}
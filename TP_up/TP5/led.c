#include "LPC210X.h"
#include "gpio.h"

/* led.c */

/* ********Old File*********

void led_Init(int led_conf)
{
	GPIO_Init(led_conf);
}

void led_Blink()
{
	int i;
	
	conf = (~GPIO_Read());
	
	while(1)
	{
		GPIO_Write(conf);
		for(i=0; i<300000; i++)
	}
}
*/

/* ********New File********** */

/* Fonction led_Init qui initialise les LEDs à utiliser
 */
 
void led_Init(int led_conf)
{
	GPIO_Init(led_conf);
}

/* Fonction led_Blink qui réalise le clignottement des LEDs
 */

void led_Blink()
{
	int i;
	int conf = (~GPIO_Read());
	while(1)
	{
		GPIO_Write(conf);
		for(i=0; i<5000; i++); /* Boucle de retard */
	}
}

/* Fonction led_Shift_left qui réalise la décalage gauche de LEDs pour les afficher successivement
 */

void led_Shift_left()
{
	int conf = (~GPIO_Read()); /* Lecture de l'état des ports pour recupérer la variable led */
	int shift_conf = conf; /* Duplication de la variable originale */
	
	while(1)
	{
		if(shift_conf != 0x0000F000) /* Mise en place d'une vérification : si on n'a pas atteint le dernier LED, alors on continue à décaler */
			shift_conf = (shift_conf << 1);
		else /* Sinon, on revient à la valeur initiale */
			shift_conf = conf;
		
		GPIO_Write(shift_conf); /* Affichage du LED */
		for(i=0; i<5000; i++); /* Boucle de retard */
	}
}
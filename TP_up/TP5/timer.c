#include "LPC210X.h"

/* timer.c */

/* Fonction timer_Init qui initialise le Timer1
 */
 
void timer_Init()
{
	SCB_VPBDIV = 0x00000001; /* Synchronisation de pclk avec cclk (voir pg. 52 du manuel) */
	
	T1_TCR = 0x00000002; /* Reset sur les registres TC et PC (voir pg. 136-137 du manuel) */
	T1_TCR = 0x00000000; /* Mise à 0 du bit de reset (voir pg. 136 du manuel) */
	
	T1_PR = 1000000; /* Division de pclk par 1M pour permettre TC d'augmenter chaque 0.1s (voir pg. 137 & 140 du manuel) */
	
	T1_MCR = 0x00000002; /* Génération des interrupts et reset sur une valeur précisée dans MR0 (voir pg. 137 du manuel) */
}

void timer_Set(int tempo)
{
	timer_Init(); /* Initialisation du timer */
	
	T1_MR0 = tempo-1; /* Spécification de la valeur de reset de TC où tempo est une multiple de 0,1s
					   * Dans notre cas, pour une interruption périodique de 0.1, on mettra tempo = 1
					   */
	
	T1_TCR = 0x00000001; /* Démarrage du compteur (voir pg. 136 du manuel) */
}
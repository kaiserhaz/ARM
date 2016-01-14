#include "LPC210X.h"
#include <intrinsics.h>
#include "led.h"

/* isr.c */

void isr_init(void)
{
	/* Partie 1.3 * A mettre en commentaire pour la partie 1.4 */

	__disable_interrupt(); /* D�sactivation des interruptions */
	VICIntSelect = 0x00000000; /* Mise � 0 du bit 0 pour s�lectionner la cat�forie IRQ */
	VICIntEnable = 0x00000020; /* Autorisation des interrupts venant de Timer 1 (voir pg. 65 & 68 du manuel) */
	VICDefVectAddr = (unsigned int) IRQ_Handler; /* R�cup�ration de l'adresse de l'ISR (voir pg. 66 du manuel) */
	__enable_interrupt(); /* R�activation des interruptions */
	
	/* Partie 1.4 * A d�commenter */
	
	/*__disable_interrupt(); /* D�sactivation des interruptions 
	PCB_PINSEL0 = 0x80000000; /* Activation de EINT2 (li� � SW4) (voir pg. 78 du manuel) 
	VICIntSelect = 0x00000000; /* Mise � 0 du bit 0 pour s�lectionner la cat�forie IRQ 
	VICIntEnable = 0x00020020; /* Autorisation des interrupts venant de Timer 1 (voir pg. 65 & 68 du manuel) 
	*/
}

void timer_interrupt()
{
	led_Shift_left(); /* Appel de l'interruption */
}	

__irq __arm void IRQ_Handler(void)
{
	timer_interrupt(); /* Appel de l'interruption */
	
	T1_IR = 0x00000001; /* Reset de l'interrupt (voir pg. 136 du manuel) */
}
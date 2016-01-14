#include "LPC210x.h"
#include "pwm.h"

void pwm_init(){
	SCB_VPBDIV = 0x1; // on met l'horloge périphérique à la même fréquence que le processeur
	
	PCB_PINSEL0 = 0x00020000; // on met les bits 19 et 18 à '10'
	
	PWM_PCR = 0x00001000; // séléction du mode "simple edge"
	
	PWM_MCR = 0x2; // mise à zéro du PWM_MTC
	
	PWM_MR0 = 60000; // fixer la fréquence à 6KHz

        PWM_LER = 0x1;
	
	PWM_MR4 = 30000; // fixer le rapport cyclique à 50%

        PWM_LER = 0x10;
	
	PWM_TCR = 0x2; // ràz de PWMTCR et "prescaler"
	
	PWM_TCR = 0x9; // activation du compteur
}

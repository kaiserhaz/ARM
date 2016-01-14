#include "LPC210X.h"

/* Fonction pxm_init() qui génère le signal PWM
 */

void pwm_init()
{
	SCP_VPBDIV = 0x00000001; /* Configuration 01 sur les bit 1:0 permet d'égaliser pclk à cclk (voir page 52 du manuel) */
	PCB_PINSEL0 = 0x00020000; /* Configuration 10 sur les bit 17:16 permet de connecter la sortie PWM4 au port 0.8 (voir page 78 du manuel) */
	PWM_PCR = 0x00001000; /* Configuration '0' sur le 5e bit et '1' sur le 13e bit permet d'utiliser le PWM en sortie 4 à la mode simple edge (voir page 154 du manuel) */
	PWM_MCR = 0x00000002; /* Configuration '1' sur le 2e bit permet de remettre à 0 le compteur lorsqu'il atteint la valeur précisée dans PWMMR0 (voir page 153 du manuel) */
	PWM_MR0 = 10000; /* On fixe la fréquence à 1kHz (F = 10MHz / PWM_MR0) */
	PWM_LER = 0x00000001; /* Reset suivant PWM_MR0 (voir page 155 du manuel) */
	PWM_MR4 = 5000; /* On fixe le rapport cyclique */
	PWM_LER = 0x00000010; /* Reset suivant PWM_MR4 (voir page 155 du manuel) */
	PWM_TCR = 0x00000002; /* Configuration '1' sur le 2e bit permet de remettre à 0 le compteur prescaler (voir page 152 du manuel) */ 
	PWM_TCR = 0x00000009; /* Configuration '1' sur le 1er et 4e bit permet de remettre à 0 le compteur prescaler et activer le mode PWM (voir page 152 du manuel) */
}

int main(void)
{
	pwm_init();
	return 0;
}








@ Exo 1.3 TD 5
@ Illustration du passage de parametres 

							@ directives de compilation --------------------------
	.text
	.align 4

	.global start
	
							@ Section de données --------------------------
TAB:		.word		0, 1, 2, 3, 4, 5, 6, 7, 8, 9			 

							@ Section de code --------------------------
start:
			ADR		R0, TAB		@ passage du parametre par le registre R0
			BL		SOMME_CARRE
			
wait:		b		wait

CARRE:		
			STMFD	SP!, {R1, LR}
			LDR		R1, [SP, #8]		@ lecture du parametre
			MUL		R0, R1, R1
			LDMFD	SP!, {R1, LR}
			ADD		SP, SP, #4
			MOV		PC, LR

SOMME_CARRE:
			STMFD	SP!, {R0, LR}
			MOV		R3, #0			@ i=0
			MOV		R1, #0
			MOV		R4, R0			@ sauvegarde R0, car modifie par CARRE
			
LOOP:		LDR		R2, [R4], #4	@ R2 <- TAB[i]	
			STR		R2, [SP, #-4]!	@ passage du parametre par la pile
			BL		CARRE
			ADD		R1, R1, R0		@ calcul somme
			ADD		R3, R3, #1
			CMP		R3, #10
			BLT		LOOP
			LDMFD	SP!, {R0, LR}
			MOV		PC, LR
		

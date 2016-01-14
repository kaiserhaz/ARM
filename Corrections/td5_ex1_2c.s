@ Exo 1.1 c) TD 5
@ Illustration du passage de parametres 

							@ directives de compilation --------------------------
	.text
	.align 4

	.global start
	
							@ Section de données --------------------------
C:		.word		0			 

start:
		@parametres
		MOV		R0, #56
		STR		R0, [SP, #-4]!
		MOV		R0, #49
		STR		R0, [SP, #-4]!
		BL		max
		
wait:	b		wait

		
max:	@ les parametres sont passes par la pile
		@ resultat dans RO
		@ sauvegarde de contexte
		STMFD	SP!, {R5, R6, LR}
		LDR		R5, [SP, #16]
		LDR		R6, [SP, #12]
		CMP		R5, R6
		MOVLT	R0, R6
		MOVGE	R0, R5
		LDMFD	SP!, {R5, R6, LR}
		ADD		SP, SP, #8	@ liberer les parametres de la pile
		MOV		PC, LR
		
		

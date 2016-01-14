@ Exo 1.1 b) TD 5
@ Illustration du passage de parametres

							@ directives de compilation --------------------------
	.text
	.align 4

	.global start
	
							@ Section de donn�es --------------------------
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
		LDR		R5, [SP, #4]
		LDR		R6, [SP]
		CMP		R5, R6
		MOVLT	R0, R6
		MOVGE	R0, R5
		ADD		SP, SP, #8	@ liberer les parametres de la pile
		MOV		PC, LR
		
		

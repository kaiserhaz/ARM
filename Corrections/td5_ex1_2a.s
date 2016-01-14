@ Exo 1.1 a) TD 5
@ Illustration du passage de parametres

							@ directives de compilation --------------------------
	.text
	.align 4

	.global start
	
							@ Section de données --------------------------
C:		.word		0			 

start:
		@parametres
		MOV		R1, #56
		MOV		R2, #49
		BL		max
		
wait:	b		wait

		
max:	@ les parametres sont passes par R1 et R2
		@ resultat dans RO
		CMP		R1, R2
		MOVLT	R0, R2
		MOVGE	R0, R1
		MOV		PC, LR
		
		

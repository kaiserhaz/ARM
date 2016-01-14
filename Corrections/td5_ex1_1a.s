@ Exo 1.1 a) TD 5
@ Illustration de la sauvegarde de contexte

							@ directives de compilation --------------------------
	.text
	.align 4

	.global start
	
							@ Section de données --------------------------
C:		.word		0			 

start:
											@ <operations>
		BL			fonction1
wait:	b	wait
											@ <operations>

		
fonction1:	
		STMFD		SP!, {R8, R9, R10, LR}
		MOV			R10, #3
		LDR			R9, C
		ADD			R8, R10, R9
		BL			fonction2
		MUL			R0, R8, R8				@ fonction2 modifie R8 -> ajouter sauvegarde de contexte
		LDMFD		SP!, {R8, R9, R10, LR}
		MOV			PC, LR
		
fonction2:	
		STMFD		SP!, {R8, LR}
		MUL			R8, R4, R4
		ADD			R0, R8, R8
		LDMFD		SP!, {R8, LR}
		MOV			PC, LR
		

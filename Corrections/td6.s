@ Exo TD 6
@ Calcul matriciel

								@ directives de compilation --------------------------
		.text
		.align 	4

		.global start
	
								@ Section de données --------------------------
MAT:	.word	1, 2, 3, 4, 5, 6, 7, 8, 9
MAT_T:	.word	0, 0, 0, 0, 0, 0, 0, 0, 0
M:		.word	3

start:
		@ passage des parametres
		ADR		R0, MAT			@ R0 <- adresse de la matrice
		ADR		R1, MAT_T		@ R1 <- adresse de la matrice transposee
		LDR		R2, M			@ R2 <- dimension de la matrice
		BL		transpose
		
wait:	b		wait


get:	MUL		R6, R4, R2		@ R6 <- j*M
		ADD		R6, R6, R3		@ R6 <- j*M+i
		MOV		R6, R6, LSL#2	@ R6 <- (j*M+i)*4
		ADD		R6, R6, R0		@ R6 <- @MAT + (j*M+i)*4
		LDR		R5, [R6]
		MOV		PC, LR

set: 	MUL		R6, R4, R2		@ R6 <- j*M
		ADD		R6, R6, R3		@ R6 <- j*M+i
		MOV		R6, R6, LSL#2	@ R6 <- (j*M+i)*4
		ADD		R6, R6, R1		@ R6 <- @MAT + (j*M+i)*4
		STR		R5, [R6]
		MOV		PC, LR

transpose: 
		STMFD	SP!, {LR}
		MOV		R4, #0			@ j=0
LOOP_J:	MOV		R3, #0			@ i=0
LOOP_I:	@ lire l element a la position (i,j)
		BL		get
		MOV		R7, R4
 		MOV		R4, R3			@ R4 <- i
		MOV		R3, R7			@ R3 <- j	
		BL 		set
		MOV		R7, R4
 		MOV		R4, R3			@ R4 <- j
		MOV		R3, R7			@ R3 <- i	
		ADD		R3, R3, #1
		CMP		R3, R2
		BLT		LOOP_I
		ADD		R4, R4, #1
		CMP		R4, R2
		BLT		LOOP_J
		LDMFD	SP!, {LR}
		MOV		PC, LR

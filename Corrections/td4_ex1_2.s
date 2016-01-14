@ Fichier ex1_2c.s  
@ Programme de v�rification des exercices du TD4
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de donn�es --------------------------
TAB:		.word		3, 107, 27, 12, 322, 155, 63
N:		.word		7

							@ Section de code --------------------------

start:	ADR		R1, TAB		@ R1 <- @TAB
		MOV		R2, #1		@ nombre de permutations
		LDR		R5, N

WHILE:	MOV		R2, #0
		MOV		R0, #1		@ I=1

FOR:	LDR		R3, [R1]		@ TAB[i]
		LDR		R4, [R1,#4]	@ TAB[i+1]
							@ R1 n'est pas modifier
		CMP		R3, R4
		STRGT	R4, [R1]		@ TAB[i] <- R4
		STRGT	R3, [R1,#4]		@ TAB[i+1] <- R3
		ADDGT	R2, R2, #1		@ NB_PERMUT = NB_PERMUT + 1
		ADD		R1, R1, #4		@ on incr�mente R1
		ADD		R0, R0, #1
		CMP		R0, R5
		BLT		FOR

		CMP		R2, #0
		ADR 		R1, TAB
		BNE		WHILE		
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait


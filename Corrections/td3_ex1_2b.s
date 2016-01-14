@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------
A:	.word	5

							@ Section de code --------------------------
start:
			LDR		R0, A
			AND		R1, R0, #7	@ tester les 3 bits de poids faible
			CMP		R1, #0
			BEQ		DIV_PAR_8
			MOV		R3, #0
			B		ENDIF
			
DIV_PAR_8: 	MOV		R3, R0, LSR#3 	@ R3 <- R0/8

ENDIF: 		
			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
  
 
  
 
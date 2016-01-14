@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------
A:	.word	5
B:	.word	5
C:	.word	0

							@ Section de code --------------------------
start:
		LDR R0, A
		LDR R1, B
		CMP R0, R1
		BNE ELSE
			MOV R2, R0
			B ENDIF
			
		ELSE:	MOV R3 , #8
				MUL R2, R1, R3
			
		ENDIF: STR R2, C
			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
  
 
  
 
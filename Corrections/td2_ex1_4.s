@ Fichier ex 1.4 TD2.s  
@ Programme de vérification des exercices du TD2
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------


							@ Section de code --------------------------

start:
				MOV	R4, #11
				MOV	R5, #16
				
				MUL R10, R4, R4
				MOV R2, #3
				MUL R7, R10, R2		@ R7 <- 3*R4*R4
				ADD R1, R4, R5		
				MOV R2, #7
				MUL R8, R1, R2		@ R8 <- 7*(R4+R5)
				SUB R6, R7, R8		
				MUL R0, R4, R5		
				MOV R2, #12
				MUL R9, R0, R2		@ R9 <- 12*R4*R5
				SUB R1, R9, #22		
				ADD R6, R6, R1		
				
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
  
 
  
 

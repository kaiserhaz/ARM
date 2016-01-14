@ Fichier ex 1.4 TD2.s  
@ Programme de vérification des exercices du TD2
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------


							@ Section de code --------------------------

start:
			MOV		R1, #11
			MUL		R2, R1, R1	@ R2 <- R1*R1
			MOV		R3, #5
			MUL		R2, R3, R2	@ R2 <- 5*R1*R1
			MOV		R3, #12
			MUL		R4, R3, R1	@ R4 <- 12*R1
			ADD		R0, R2, R4
			SUB		R0, R0, #2
			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
  
 
  
 

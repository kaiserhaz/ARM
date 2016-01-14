@ Fichier arith.s  
@ Programme de vérification des exercices du TD1
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							           @ Section de données --------------------------
 X:      .word         0, 1, 2, 3, 4, 5, 6, 7, 8, 9
 Y:      .word         0, 0, 0, 0, 0, 0, 0, 0, 0
                   				       @ Section de code --------------------------
start: 

		ADR     r2, X
		ADR     r5, Y
		MOV		r0, #1
	   
LOOP:  
		LDR		r3, [r2], #4	@ r3 <- X[i-1]
		LDR		r4, [r2]		@ r4 <- X[i]
		ADD		r6, r3, r4
		STR		r6, [r5], #4	@ Y[i-1] <- r6
		ADD		r0, r0, #1
		CMP		r0, #9
		BLE		LOOP
	                                           
			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
  
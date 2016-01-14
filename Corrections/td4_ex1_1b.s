@ Fichier arith.s  
@ Programme de vérification des exercices du TD1
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							           @ Section de données --------------------------
 S:      .word         0
 X:      .word         1, -2, 3, -4, 5, -6, 7, -8, -9
                   				       @ Section de code --------------------------
start: 

       ADR      r2, X
	   LDR      r5, S
	   MOV      r0, #0
	   
	   
LOOP:  
       LDR      r1, [r2], #4
	   CMP      r1, #0
	   ADDGT    r5, r5, r1
	   ADD      r0, r0, #1
	   CMP      r0, #9
	   BLT      LOOP
	   STR      r5, S

	   
wait:	b wait

 



                                        

                                      @ DECALAGES
					
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
  
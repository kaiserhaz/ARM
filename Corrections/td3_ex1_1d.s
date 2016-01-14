@ Fichier td3.s  
@ Ce programme calcule ...
@ et range le résultat ...
@
@ Paramètres :
@   r0 - ...
@   r1 - ...
@   r2 - ...
@   r3 - ...
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------
RES:		.word		0			 
N:		.word		5			


							@ Section de code --------------------------

start:
							@ ARITHMETIQUE
		LDR 		r1, N			 
		MOV 		r0, #0			 
LOOP: 	
		ADD 		r0, r0, r1		 
		SUB		r1, r1, #1		 
		CMP		r1, #0			 
		BGT 		LOOP			 
		STR		r0, RES		 

			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 		wait
  
 
  
 

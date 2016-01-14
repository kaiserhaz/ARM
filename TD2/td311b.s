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
NUM1:		.word		3, -17, 27, -12, 322	 


							@ Section de code --------------------------

start:
							@ ARITHMETIQUE
		LDR 		r1, N			 
		ADR 		r2, NUM1		 
		MOV 		r0, #0			 
LOOP: 	LDR 		r3, [r2]			 		 
		ADD 		r0, r0, r3		 
		ADD		r2, r2, #4		 
		SUB		r1, r1, #1		 
		CMP		r1, #0			 
		BGT 		LOOP			 
		STR		r0, RES		 

			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 		wait
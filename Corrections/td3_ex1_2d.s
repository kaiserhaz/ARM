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
A:		.word		5			 
B:		.word		5			
C:		.word		0			


							@ Section de code --------------------------

start:
							@ ARITHMETIQUE
		LDR 		r0, A			 
		LDR 		r1, B			 
		CMP			r0, r1			 

		MOVGT			r2, r0
		MOVLE			r2, r1		

		STR			r2, C		 

			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 		wait
  
 
  
 

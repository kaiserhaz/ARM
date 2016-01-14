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
A:		.word		1			 
B:		.word		2			
C:		.word		3			
MAX:	.word		0	

							@ Section de code --------------------------

start:
		LDR			r0, A
		LDR			r1, B
		LDR			r2, C

		CMP 		r0, r1
		BGE			ASUPEGALB
		CMP			r1, r2
		BGE			BSUPEGALC
		MOV			r3, r2		@	MAX = C
		B			FINMAX
ASUPEGALB: 
		CMP			r0, r2
		BGE			ASUPEGALC
		MOV			r3, r2		@	MAX = C
		B			FINMAX
		
BSUPEGALC: 
		MOV			r3, r1		@ MAX = B
		B			FINMAX
		
ASUPEGALC: 
		MOV			r3, r0		@ MAX = A
		
FINMAX:		
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 		wait
  
 
  
 

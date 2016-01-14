@ Fichier arith.s  
@ Programme de vérification des exercices du TD1
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------


							@ Section de code --------------------------

start:
							@ DECALAGES
		mov 	r0, #222  
		mov 	r0, r0, LSR#2  

		mov 	r0, #222  
		mov 	r0, r0, ASR#2  		@ sur 32 bits

		mov 	r0, #222  
		mov 	r0, r0, LSL#2  

		mov 	r0, #222  
		mov 	r0, r0, ASL#2  	
			
		mov 	r0, #996  
		mov 	r0, r0, LSR#2  

		mov 	r0, #996  
		mov 	r0, r0, ASR#2  		@ sur 32 bits

		mov 	r0, #996  
		mov 	r0, r0, LSL#3  
		mov 	r0, #996  
		mov 	r0, r0, ROR#3		@ sur 32 bits  

							@ ADDITIONS
		mov 	r1, #0x08000000  
		mov 	r2, #0x07000000  
		adds	r0, r1, R2
			
		mov 	r1, #0x08000000  
		mov 	r2, #0x08000000  
		adds	r0, r1, R2
			
		mov 	r1, #0x40000000  
		mov 	r2, #0x30000000  
		adds	r0, r1, R2
			
		mov 	r1, #0x40000000  
		mov 	r2, #0x40000000  
		adds	r0, r1, R2
			
		mov 	r1, #0x08000000  
		mov 	r2, #0xFFFFFFFF  
		adds	r0, r1, R2
			
		mov 	r1, #0xF0000000  
		mov 	r2, #0xFFFFFFFF  
		adds	r0, r1, R2
			
		mov 	r1, #0x80000000  
		mov 	r2, #0xFFFFFFFF  
		adds	r0, r1, R2

		mov 	r1, #0x80000000  
		mov 	r2, #0x80000000  
		adds	r0, r1, R2
		
							@ SOUSTRACTIONS
		mov 	r1, #0x08000000  
		mov 	r2, #0x04000000  
		subs	r0, r1, R2

		mov 	r1, #0x04000000  
		mov 	r2, #0x08000000  
		subs	r0, r1, R2

		mov 	r1, #0x08000000  
		mov 	r2, #0x08000000  
		subs	r0, r1, R2

		mov 	r1, #0xF0000000  
		mov 	r2, #0x7F000000  
		subs	r0, r1, R2

		mov 	r1, #0x7F000000  
		mov 	r2, #0xF0000000  
		subs	r0, r1, R2
			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
@wait:		b 	wait
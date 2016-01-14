@ Fichier Ex_1_5.s  
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------


							@ Section de code --------------------------

start:
							@ DECALAGES
							
		mov	r1,	#11
		
		mov	r2, #5			@ r2 = 5
		mul	r3,	r1, r1		@ r3 = (r1)*(r1)
		mul	r4,	r3,	r2		@ r4 = r3 * r2 = 5*(r1)*(r1)
		
		mov	r2, #12			@ r2 = 12
		mul	r3,	r1,	r2		@ r3 = 12*(r1)
		
		add r2, r4, r3		@ r2 = r4 + r3 = 5*(r1)*(r1) + 12*(r1)
		
		sub r0, r2,	#2		@ r0 = r6 - 2 = 5*(r1)*(r1) + 12*(r1) - 2
		
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
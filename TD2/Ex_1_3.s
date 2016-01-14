@ Fichier Ex_1_3.s  
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------


							@ Section de code --------------------------

start:
							@ DECALAGES
		
		mov		r4,	#6
		mov		r5,	#2
		
		mul		r7,	r4,	r4	@ r7 = r4 * r4
		mov		r2,	#3		@ r2 = 3
		mul		r0,	r7,	r2	@ r0 = r7 * r2 = 3 * r4 * r4
		
		add		r8,	r4,	r5	@ r8 = r4 + r5
		mov		r2,	#7		@ r2 = 7
		mul		r1,	r8,	r2	@ r1 = r8 * r2 = 7 * (r4 + r5)
		
		sub		r6,	r0,	r1	@ r6 = r0 - r1 = 3*r4*r4 - 7*(r4+r5)
		
		mul		r9,	r4,	r5	@ r9 = r4 * r5
		mov		r2,	#12		@ r2 = 12
		mul		r0,	r9,	r2	@ r0 = r9 * r2 = 12 * r4 * r5
		
		sub		r1,	r0,	#22	@ r1 = r0 - 22 = 12*r4*r5 - 22
		
		add 	r10,r6, r1	@ r10 = r6 + r1 = 3*r4*r4 - 7*(r4+r5) + 12*r4*r5 - 22
			
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
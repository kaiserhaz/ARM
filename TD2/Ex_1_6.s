@ Fichier Ex_1_6.s  
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------


							@ Section de code --------------------------

start:
							@ DECALAGES
							
		mov	r4,	#2
		mov	r5,	#3
		
		add	r0,	r4,	r5		@ r0 = r4 + r5
		mul	r6,	r0, r0		@ r3 = (r0)*(r0) =(r4+r5)*(r4+r5)
		
		mul	r0, r4,	r4		@ r0 = (r4)*(r4)
		mul	r1,	r5,	r5		@ r1 = (r5)*(r5)
		mul r2,	r4,	r5		@ r2 = (r4)*(r5)
		mov r7,	r2,	r3,	asl #1		@ r7 = 2*(r4)*(r5)
		add r6, r0, r1		@ r6 = r0 + r1 = (r4)*(r4) + (r5)*(r5)
		add	r6,	r6,	r7		@ r6 = r0 + r1 = (r4)*(r4) + 2*(r4)*(r5) + (r5)*(r5)
		
		add	r0,	r4,	r5		@ r0 = r4 + r5
		sub	r1,	r4,	r5		@ r1 = r4 - r5
		mul	r6,	r0, r1		@ r3 = (r0)*(r1) =(r4+r5)*(r4-r5)
		
		mul	r0, r4,	r4		@ r0 = (r4)*(r4)
		mul	r1,	r5,	r5		@ r1 = (r5)*(r5)
		sub	r6,	r0,	r1		@ r6 = r0 - r1 = (r4)*(r4) - (r5)*(r5)
		
		mov	r0,	#2
		mul	r1, r4,	r4		@ r0 = (r4)*(r4)
		mul	r1,	r5,	r5		@ r1 = (r5)*(r5)
		mul r2,	r4,	r5		@ r2 = (r4)*(r5)
		mov	r3,	#2			@ r3 = 2
		mul r7,	r2,	r3		@ r7 = (r2)*(r3) = 2*(r4)*(r5)
		add r6, r0, r1		@ r6 = r0 + r1 = (r4)*(r4) + (r5)*(r5)
		add	r6,	r6,	r7		@ r6 = r0 + r1 = (r4)*(r4) + 2*(r4)*(r5) + (r5)*(r5)
		
		add r2, r4, r3		@ r2 = r4 + r3 = 5*(r1)*(r1) + 12*(r1)
		
		sub r0, r2,	#2		@ r0 = r6 - 2 = 5*(r1)*(r1) + 12*(r1) - 2
		
					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
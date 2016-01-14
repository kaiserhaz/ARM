@ Fichier Ex_2.s
@ Pour utiliser, veuillez enlever les commentaires
@
							@ directives de compilation --------------------------
  .text
  .align 4 
  
  .global start
							@ Section de données ------
S:  .word  0     
X:  .word  0, 1, 2, 3, 4, 5, 6, 7, 8, 9   
Y:  .word  0, 1, 2, 3, 4, 5, 6, 7, 8, 9
Z:  .word  0, 1, -2, 3, -4, 5, -6, 7, -8, 9

							@ Section de code ---------
start:

@@@@@@@
@@@@@@@@
@@@@@@@@@
@@@@@
@@@@@	Ex 1.a
@@@@@
@@@@@@@@@
@@@@@@@@
@@@@@@@

@		for(r0=0;r0<10;r0++)
@			r5 = r5 + [r2 + r0] + [r4 + r0]
@		
@		Enter loop
@		
@		First, store X in r1, post-index auto
@		Second, store Y in r3, post-index auto
@
@		Add X to Y, store in r1
@		Add S to X, store in r5
@
@		Add 1 to r0, store in r0
@
@		Compare r0 to 10
@		Branch to LOOP if LT

@		ADR		r2,	X		@ r2 pointe sur X[0] 
@		ADR		r4,	Y		@ r4 pointe sur Y[0] 
@		LDR		r5,	S		@ r5 <- valeur de S 
@		MOV		r0,	#0		@ I=0
@		
@LOOP:	LDR		r1,	[r2],	#4
@		LDR		r3,	[r4],	#4
@		
@		ADD		r1,	r1,	r3
@		ADD		r5,	r5,	r1
@		
@		ADD		r0,	r0,	#1
@		
@		CMP		r0,	#10
@		BLT		LOOP
@		B		EXIT

@@@@@@@
@@@@@@@@
@@@@@@@@@
@@@@@
@@@@@	Ex 1.b
@@@@@
@@@@@@@@@
@@@@@@@@
@@@@@@@

@		for(r0=0;r0<10;r0++)
@			r5 = r5 + [r2 + r0] + [r4 + r0]
@		
@		Enter loop
@		
@		First, store X in r1, post-index auto
@		Second, compare X to 0
@		Branch to INCREMENT if negative
@
@		Add S to X, store in r5
@
@		Add 1 to r0, store in r0
@
@		Compare r0 to 10
@		Branch to LOOP if LT

		ADR		r2, Z		@ r2 pointe sur X[0] 
		LDR		r5, S		@ r5 <- valeur de S 
		MOV		r0, #0

LOOP:	LDR		r1,	[r2],	#4
		CMP		r1,	#0
		BNE		INCREMENT
		
		ADD		r5,	r5,	r1
		
		ADD		r0,	r0,	#1
		
INCREMENT:
		CMP		r0,	#10
		BLT		LOOP
		
		B		EXIT

EXIT:					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 		wait
@ Hai
@ I are Ex1.asm
@ Plesase uncomment the variables and it's repective exercice, then compile!
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------
@ Constants pour 1.1b)
@
@S:	.word	0
@X:	.word	0,	1,	-2,	3,	-4,	5,	-6,	7,	-8,	9

@ Constants pour 1.1c)
@
@X:	.word	0,	1,	2,	3,	4,	5,	6,	7,	8,	9
@Y:	.word	0,	0,	0,	0,	0,	0,	0,	0,	0

@ Constants pour 1.2)
@
@TAB:	.word	3,	107,	27,	12,	322,	155,	63
@N:	.word	7

@ Constants pour 1.3)
@TABLES:	.byte	0,	0,	0,	0,	0,	0,	0,	0
@VALEUR:	.word	2809016305

							@ Section de code --------------------------

start:

@@@
@@@@
@@@@@
@@
@@	Ex1.1b)
@@
@@@@@
@@@@
@@@
	
@	ADR		r2,	X
@	LDR		r5,	S
@	MOV		r0,	#0
@	
@LOOP:
@
@	LDR		r1,	[r2],	#4
@	CMP		r1,	#0
@	ADDGT	r5,	r5,	r1
@	
@	ADD		r0,	r0,	#1
@	CMP		r0,	#10
@	BLT		LOOP
@
@	STR		r5,	S
@	B		wait

@@@
@@@@
@@@@@
@@
@@	Ex1.1c)
@@
@@@@@
@@@@
@@@
	
@	ADR		r2,	X
@	ADR		r4,	Y
@	MOV		r0,	#1
@	
@LOOP:
@
@	LDR		r1,	[r2],	#4
@	LDR		r3,	[r2]
@	ADD		r5,	r1,	r3
@	STR		r5,	[r4],	#4
@	
@	ADD		r0, #1
@	CMP		r0,	#9
@	BLE		LOOP
@	B		wait

@@@
@@@@
@@@@@
@@
@@	Ex1.2)
@@
@@@@@
@@@@
@@@
	
@	ADR		r0,	TAB
@	MOV		r1,	#0
@	
@MAINLOOP:
@
@	MOV		r5,	r0						@ Restaurer l'adresse de r0
@	MOV		r2,	#0						@ Recommencer le compteur de permutation
@
@FORLOOP:
@
@	LDR		r3,	[r5]					@ Charger la valeur trouve a r5
@	LDR		r4,	[r5,	#4]!			@ Pre-indexe auto avec write-back, donc on incremente l'adresse dans r5 par 4
@	CMP		r3,	r4
@	STRGT	r3,	[r5]					@ Si r3>r4, alors Mem[r5] <- r3
@	STRGT	r4,	[r5,	#-4]			@ 				  Mem[r5-4] <- r4
@	
@	ADDGT	r2,	r2,	#1					@ S'il y a permutation, alors on incremente le compteur
@	
@	ADD		r1,	r1,	#1					@ Parcourir tout le tableau!
@	CMP		r1,	#7						@
@	BLT		FORLOOP						@
@	
@	MOV		r1,	#0						@ R-a-z du compteur de tableau
@	
@	CMP		r2,	#0						@ S'il n'y a pas de permutation, on sort de la boucle!
@	BGT		MAINLOOP
@
@	B		wait

@@@
@@@@
@@@@@
@@
@@	Ex1.3)
@@
@@@@@
@@@@
@@@
	
@	ADR		r0,	#8
@	LDR		r1,	VALEUR
@	
@LOOP:

	@
	@ Didn't do it in TD!
	@

@	BNE		LOOP

							@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 	wait
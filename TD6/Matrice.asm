@ Hai
@ I are Matrice.asm
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start
  
							@ Section de données --------------------------

MAT:	.word	1,	2,	3,	4,	5,	6,	7,	8,	9
MAT_T:	.word	0,	0,	0,	0,	0,	0,	0,	0,	0
M:	.word	3
							
							@ Section de code --------------------------

start:

MAIN:

							@ Initialisation des registres a utiliser
							@ r0 : Adresse d'une matrice
							@ r2 : Dimension d'une matrice
							@ r3 : Position horizontale (i)
							@ r4 : Position verticale (j)
							@ r5 : Valeur a lire/ecrire
							@
							@ r1 : Adresse de la matrice tranposee

		ADR		r0,	MAT
		ADR		r1, MAT_T
		LDR		r2,	M
		
		MOV		r3,	#1
		MOV		r4,	#1
		
		BL		GET
		
		MOV		r3,	#2
		MOV		r4,	#2
		MOV		r5,	#0xA
		
		BL		SET
		
		BL		TRANSP
		
WAIT:	B		WAIT

GET:
		
		MUL		r6,	r4,	r2
		ADD		r6,	r6,	r3
		MOV		r6,	r6,	LSL	#2

		LDR		r5,	[r0, +r6]

		MOV		pc, lr

SET:
		
		MUL		r6,	r4,	r2
		ADD		r6,	r6,	r3
		MOV		r6,	r6,	LSL	#2

		STR		r5,	[r0, +r6]

		MOV		pc, lr

TRANSP:
		STR		lr,	[sp, #-4]
		
		MOV		r4,	#0
JLOOP:	MOV		r3, #0
ILOOP:	
		STMFD	sp!,	{r0,	r3,	r4}
		BL		GET
		
		MOV		r0, r1
		
		MOV		r7,	r4
		MOV		r4,	r3
		MOV		r3,	r7
		
		BL		SET
		
		LDMFD	sp!,	{r0,	r3,	r4}
		
		ADD		r3, r3, #1
		CMP		r3,	r2
		BLT		ILOOP
		
		ADD		r4,	r4, #1
		CMP		r4,	r2
		BLE		JLOOP

		LDR		lr, [sp],	#4
		MOV		pc, lr

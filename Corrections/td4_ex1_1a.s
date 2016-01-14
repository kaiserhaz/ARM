@ Exo 1.a) TD 4
@ Somme des elements de deux tableaux

							@ directives de compilation --------------------------
	.text
	.align 4

	.global start
	
S:	.word	0
X: 	.word	0, 1, 2, 3, 4, 5, 6, 7, 8, 9
Y: 	.word	0, 1, 2, 3, 4, 5, 6, 7, 8, 9

start:
		ADR	r2, X
		ADR	r4, Y
		LDR	r5, S
		MOV r0, #0	@ i=0

LOOP:	LDR r3, [r2], #4
		LDR r6, [r4], #4
		ADD r5, r5, r3 		@ S <- S+X[i]
		ADD r5, r5, r6		@ S <- S+X[i] + Y[i]
		ADD r0, r0, #1		@ i++
		CMP r0, #10
		BLT	LOOP			@ i<10
		STR r5, S
		
wait:	b	wait

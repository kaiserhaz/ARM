@ Fichier Ex_2.s
@ Pour utiliser, veuillez enlever les commentaires
@
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start

							@ Section de données --------------------------
A:		.word	4
B:		.word	8
C:		.word	0			 
D:		.word	5
							@ Section de code --------------------------

start:
							@ ARITHMETIQUE
							
@@@@@@@
@@@@@@@@
@@@@@@@@@
@@@@@
@@@@@	Ex 2
@@@@@
@@@@@@@@@
@@@@@@@@
@@@@@@@							

@		LDR 		r0, A
@		LDR			r1,	B
@		CMP			r0,	r1
@		BLE			ELSE
@		
@		MOV			r2,	r0
@		B			ENDIF
@		
@ELSE:	MOV			r2,	r1			 
@ENDIF:	STR			r2, C		 
@		B			PROGEND
		
@@@@@@@
@@@@@@@@
@@@@@@@@@
@@@@@
@@@@@	Ex 2.a
@@@@@
@@@@@@@@@
@@@@@@@@
@@@@@@@	
		
@		LDR 		r0, A
@		LDR			r1,	B
@		TEQ			r1,	r0
@		BEQ			EQUAL
@
@		MOV			r3,	r1, LSL #3
@		B			END1
@		
@EQUAL:	MOV			r3, r0
@END1:	STR			r3,	C
@		B			PROGEND
		
@@@@@@@
@@@@@@@@
@@@@@@@@@
@@@@@
@@@@@	Ex 2.b
@@@@@
@@@@@@@@@
@@@@@@@@
@@@@@@@	

@
@	On compare a et b, et si a == b, on branche vers une etiquette qui nous permet d'affecter a à c, sinon on affecte b/8 à c
@
@	Question : comment fait-on une division par 8? Decalage a droite de 3
@

@
@	On utilise cette algorithme :
@
@	Si a && 0x7 == 0	@ On veut que les 3 premier bits de poids faible soit à 0
@
@		res = a >> 3
@
@	Sinon
@
@		res = 0
@

@		LDR 		r0, A
@		LDR			r1,	B
@		TST			r1,	#0x7
@		BEQ			DIVISE
@
@		MOV			r3,	#0
@		B			END2
@		
@DIVISE:	MOV			r3,	r0,	LSR #3		
@END2:	STR			r3,	C
@		B			PROGEND

@@@@@@@
@@@@@@@@
@@@@@@@@@
@@@@@
@@@@@	Ex 2.c
@@@@@
@@@@@@@@@
@@@@@@@@
@@@@@@@	

@
@	Facon la plus triviale : comparer 1 par 1 les nombres.
@

@		LDR 		r0, A
@		LDR			r1,	B
@		LDR			r2,	D
@		CMP			r0,	r1
@		BGT			R0_GT_R1
@		
@		CMP			r1, r2
@		BGT			R1_GT_R2
@		
@		MOV			r3,	r2
@		B			END3
@		
@R1_GT_R2:
@		MOV			r3,	r1
@		B			END3
@		
@R0_GT_R1:
@		CMP			r0,	r2
@		BGT			R0_GT_R2
@		
@		MOV			r3,	r2
@		B			END3
@		
@R0_GT_R2:
@		MOV			r3,	r0
@		B			END3
@
@END3:	STR			r3,	C
@		B			PROGEND

@@@@@@@
@@@@@@@@
@@@@@@@@@
@@@@@
@@@@@	Ex 2.d
@@@@@
@@@@@@@@@
@@@@@@@@
@@@@@@@	

@
@	On utilise les suffix conditionnels au lieu des branchements
@

@		LDR 		r0, A
@		LDR			r1,	B
@		CMP			r0,	r1
@		MOVLE		r2,	r1
@		MOVGT		r2,	r0
@		STR			r2, C		 
@		B			PROGEND

PROGEND:					  		@ Pour finir, on bloque le processeur dans une boucle infinie vide
wait:		b 		wait
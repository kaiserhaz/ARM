@ Hai
@ I are Ex2.asm
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start
  
							@ Section de données --------------------------

RES:	.word	0
							
							@ Section de code --------------------------

start:

@
@@
@@@
@@@@
@@@@@
@@@@@@
@@@@@@@ Ex2.a)
@@@@@@
@@@@@
@@@@
@@@
@@
@

@MAIN:
@
@	MOV		r0,	#56
@	MOV		r1,	#49		
@	BL		MAX
@	
@WAIT:
@	B		WAIT
@	
@MAX:
@
@	CMP		r0,	r1
@	STRGT	r0,	RES
@	STRLE	r1,	RES
@	MOV		PC,	LR

@
@@
@@@
@@@@
@@@@@
@@@@@@
@@@@@@@ Ex2.b)
@@@@@@
@@@@@
@@@@
@@@
@@
@

@MAIN:
@
@	MOV		r0,	#56
@	MOV		r1,	#49	
@	STMFD	SP!,	{r1,	r0}		
@	BL		MAX
@	
@WAIT:
@	B		WAIT
@	
@MAX:
@	LDR		r4,	[SP,	#4]
@	LDR		r5,	[SP]
@	CMP		r4,	r5
@	STRGT	r4,	RES
@	STRLE	r5,	RES
@	ADD		SP,	SP,	#8				@ Libere les parametres de la pile
@	MOV		PC,	LR

@
@@
@@@
@@@@
@@@@@
@@@@@@
@@@@@@@ Ex2.c)
@@@@@@
@@@@@
@@@@
@@@
@@
@

MAIN:

	MOV		r0,	#56
	MOV		r1,	#49	
	STMFD	SP!,	{r1,	r0}		
	BL		MAX
	
WAIT:
	B		WAIT
	
MAX:
	LDR		r4,	[SP,	#4]
	LDR		r5,	[SP]
	CMP		r4,	r5
	STRGT	r4,	RES
	STRLE	r5,	RES
	ADD		SP,	SP,	#8				@ Libere les parametres de la pile
	MOV		PC,	LR

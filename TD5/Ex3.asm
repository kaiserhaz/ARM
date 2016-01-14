@ Hai
@ I are Ex3.asm
    
							@ directives de compilation --------------------------
 
  .text
  .align 4 
  
  .global start
  
							@ Section de données --------------------------

X:	.word	1,	2,	3,	4,	5,	6,	7,	8,	9,	10
							
							@ Section de code --------------------------

start:

MAIN:

	MOV		r2,	#0					@ Compteur
	MOV		r1,	#0					@ Resultat
	ADR		r0,	X					@ Adresse du tableau
	BL		SOMME_CARRE				@ On entre dans une boucle de calcul
	
WAIT:
	B		WAIT
	
CARRE:
	LDR		r4,	[SP,	#4]			@ On a passe le parametre par pile, donc il faut le recuperer
	MUL		r0,	r4,	r4				
	MOV		PC,	LR					@ Retour a SOMME_CARRE
	
SOMME_CARRE:
	STMFD	SP!,	{r0,	LR}		@ On empile LR et l'adresse de X stocke en r0
LOOP:
	LDR		r5,	[r0],	#4
	STMFD	SP!,	{r0,	r5}		@ CARRE exige le passage par la pile des parametres, donc il faut empiler r5
	BL		CARRE
	
	ADD		r1,	r1,	r0				@ Addition des carres
	LDR		r0,	[SP]				@ Restauration de la valeur originale de r0
	ADD		SP,	SP,	#8				@ On libere le parametre passe
	ADD		r2,	r2,	#1				@ On augmente le compteur
	
	CMP		r2,	#10
	BLT		LOOP					@ Tant que l'on n'a pas parcouru tout le tableau, on boucle
	
	LDMFD	SP!,	{r0,	LR}		@ Restaurer la valeur originale de r0 et LR
	ADD		SP,	SP,	#8				@ Libere les parametres de la pile
	MOV		PC,	LR
///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    16/May/2012  14:12:17 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  arm                                                     /
//    Endian       =  little                                                  /
//    Source file  =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\gpio.c        /
//    Command line =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\gpio.c -lB    /
//                    C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\List\   /
//                    -o C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\Obj\ /
//                     --no_cse --no_unroll --no_inline --no_code_motion      /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=ARM7TDMI -e --fpu=None            /
//                    --dlib_config "C:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.0\arm\INC\c\DLib_Config_Normal.h"           /
//                    --interwork --cpu_mode arm -Ol                          /
//    List file    =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\List\gp /
//                    io.s                                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME gpio

        PUBLIC GPIO_Init
        PUBLIC GPIO_Read
        PUBLIC GPIO_Write

// C:\users\elec3\TP_ARM\tp2_miranda_kamarul\gpio.c
//    1 #include "LPC210X.h"
//    2 
//    3 /*	Fonction qui permet de configurer le port parallèle au travers du registre
//    4  *	GPIO_IODIR
//    5  *	Selon le manuel, ce registre se situe à l'adresse 0xE0028008
//    6  */

        SECTION `.text`:CODE:NOROOT(2)
        ARM
//    7 void GPIO_Init(int config){
//    8 	GPIO_IODIR = config;	/* 	On initialise le GPIO_DIR	*/
GPIO_Init:
        MOV      R1,#-536870904
        ORR      R1,R1,#0x28000
        STR      R0,[R1, #+0]
//    9 }
        BX       LR               ;; return
//   10 
//   11 /*	Fonction qui renvoie la valeur du registre GPIO_IOPIN
//   12  *	Selon le manuel, ce registre se situe à l'adresse 0xE0028000
//   13  */

        SECTION `.text`:CODE:NOROOT(2)
        ARM
//   14 short GPIO_Read(){
//   15 	return GPIO_IOPIN;
GPIO_Read:
        MOV      R0,#-536870912
        ORR      R0,R0,#0x28000
        LDR      R0,[R0, #+0]
        LSL      R0,R0,#+16
        ASRS     R0,R0,#+16
        BX       LR               ;; return
//   16 }
//   17 /*	Fonction qui permet d'écrire l'état correspondant à mot dans le GPIO
//   18  *	en utilisant les registres GPIO_IOSET et GPIO_IOCLR
//   19  *	Selon le manuel, ces registres se trouvent respectivement aux adresses
//   20  *	0xE0028004 et 0xE002800C
//   21  */

        SECTION `.text`:CODE:NOROOT(2)
        ARM
//   22 void GPIO_Write(int mot){
//   23     GPIO_IOSET = 0x0000FF00; /* on éteint toutes les leds */
GPIO_Write:
        MOV      R1,#-536870908
        ORR      R1,R1,#0x28000
        MOV      R2,#+65280
        STR      R2,[R1, #+0]
//   24     GPIO_IOCLR = mot;	/*	On allume chacune des leds correspondant au mot	*/
        MOV      R1,#-536870900
        ORR      R1,R1,#0x28000
        STR      R0,[R1, #+0]
//   25 }
        BX       LR               ;; return

        END
// 
// 72 bytes in section .text
// 
// 72 bytes of CODE memory
//
//Errors: none
//Warnings: 1

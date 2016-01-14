///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    16/May/2012  15:17:28 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  arm                                                     /
//    Endian       =  little                                                  /
//    Source file  =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\led.c         /
//    Command line =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\led.c -lB     /
//                    C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\List\   /
//                    -o C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\Obj\ /
//                     --no_cse --no_unroll --no_inline --no_code_motion      /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=ARM7TDMI -e --fpu=None            /
//                    --dlib_config "C:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.0\arm\INC\c\DLib_Config_Normal.h"           /
//                    --interwork --cpu_mode arm -Ol                          /
//    List file    =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\List\le /
//                    d.s                                                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME led

        EXTERN GPIO_Init
        EXTERN GPIO_Read
        EXTERN GPIO_Write

        PUBLIC led_Blink
        PUBLIC led_Init

// C:\users\elec3\TP_ARM\tp2_miranda_kamarul\led.c
//    1 /* led.c */
//    2 
//    3 /* Fonction led_Init qui initialise les LEDs à utiliser
//    4  */
//    5 

        SECTION `.text`:CODE:NOROOT(2)
        ARM
//    6 void led_Init(int led_conf)
//    7 {
led_Init:
        PUSH     {R12,LR}
//    8 	GPIO_Init(led_conf);
        BL       GPIO_Init
//    9 
//   10 }
        POP      {R0,LR}
        BX       LR               ;; return
//   11 
//   12 /* Fonction led_Blink qui réalise le clignottement des LEDs
//   13  */
//   14 

        SECTION `.text`:CODE:NOROOT(2)
        ARM
//   15 void led_Blink()
//   16 {
led_Blink:
        PUSH     {R4,LR}
//   17 	int i;
//   18 	
//   19 	int conf = (~GPIO_Read());
        BL       GPIO_Read
        MVNS     R4,R0
//   20 
//   21 	while(1)
//   22 	{
//   23 		GPIO_Write(conf);
??led_Blink_0:
        MOVS     R0,R4
        BL       GPIO_Write
        B        ??led_Blink_0
//   24 		//for(i=0; i<300000; i++); /* Boucle de retard */
//   25 	}
//   26 }

        END
// 
// 40 bytes in section .text
// 
// 40 bytes of CODE memory
//
//Errors: none
//Warnings: 4

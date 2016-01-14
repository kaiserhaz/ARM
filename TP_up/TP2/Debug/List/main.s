///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    16/May/2012  15:20:05 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  arm                                                     /
//    Endian       =  little                                                  /
//    Source file  =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\main.c        /
//    Command line =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\main.c -lB    /
//                    C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\List\   /
//                    -o C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\Obj\ /
//                     --no_cse --no_unroll --no_inline --no_code_motion      /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=ARM7TDMI -e --fpu=None            /
//                    --dlib_config "C:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.0\arm\INC\c\DLib_Config_Normal.h"           /
//                    --interwork --cpu_mode arm -Ol                          /
//    List file    =  C:\users\elec3\TP_ARM\tp2_miranda_kamarul\Debug\List\ma /
//                    in.s                                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        EXTERN GPIO_Write
        EXTERN led_Blink
        EXTERN led_Init

        PUBLIC main

// C:\users\elec3\TP_ARM\tp2_miranda_kamarul\main.c
//    1 #include "LPC210X.h"

        SECTION `.text`:CODE:NOROOT(2)
        ARM
//    2 int main()
//    3 {
main:
        PUSH     {R12,LR}
//    4 /*  int i,j;
//    5   question prépa
//    6   GPIO_Init(0x0000FF00);
//    7   for(i=0;i<1000000;i++){
//    8 
//    9     GPIO_Write(0x00000F00);
//   10       for(j=0;j<3000;j++){
//   11 
//   12     }
//   13   }
//   14 */
//   15   led_Init(0x0000FF00);
        MOV      R0,#+65280
        BL       led_Init
//   16   GPIO_Write(0x00000100);
        MOV      R0,#+256
        BL       GPIO_Write
//   17   //led_Init(0x00000F00);
//   18 
//   19 
//   20    led_Blink();
        BL       led_Blink
//   21 
//   22 
//   23   return 0;
        MOV      R0,#+0
        POP      {R1,LR}
        BX       LR               ;; return
//   24 }

        END
// 
// 36 bytes in section .text
// 
// 36 bytes of CODE memory
//
//Errors: none
//Warnings: 4

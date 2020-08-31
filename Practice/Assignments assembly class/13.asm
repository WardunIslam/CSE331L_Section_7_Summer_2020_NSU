
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

L1: NOP 

L2: MOV AX, 0F000H
    MOV DS, AX
    MOV BX, 0FFFFH 
    MOV DS:[BX], 0FFH
    MOV BL, DS:[BX] 
    MOV AL, 00H
    MOV CL, 08H

L3: RCL BL, 1
    JNC L4
    DEC CL
    JNZ L3
    JMP L5

L4: INC AL
    DEC CL
    JNZ L3

L5: HLT

ret






; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

L1: NOP

L2: MOV CL, 0AH
    MOV CH, '0'
    MOV AX, 0000H
    MOV DS, AX
    MOV BX, 0000H

L3: MOV AL, CH
    SUB AL, 30H
    MOV DS:[BX], AL
    INC BL
    INC CH
    DEC CL
    JNZ L3

L4: HLT
    
ret
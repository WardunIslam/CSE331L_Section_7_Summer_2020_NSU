
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

L1: NOP 

L2: MOV AL, 01H
    MOV AH, 00H
    ADD AL, AH
    MOV BL, 00H
    MOV BH, 00H
    MOV CL, 08H

L3: RCL AL, 1
    JC L5

L4: INC BH
    DEC CL
    JNZ L3
    JMP L6

L5: INC BL
    DEC CL
    JNZ L3
    
L6: MOV AL, BL
    MOV AH, 00H
    MOV BL, 02H
    DIV BL
    ADD AL, 00H
    JZ L7

L7: ADD AH, 00H
    JZ L9
    
L8: MOV AH, 02
    MOV DL, '0'
    INT 21H
    JMP L10
    
L9: MOV AH, 02
    MOV DL, 'E'
    INT 21H
      
L10: HLT

ret





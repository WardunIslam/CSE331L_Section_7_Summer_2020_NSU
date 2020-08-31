
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

L1: NOP

L2: MOV AX, 0000H
    MOV DS, AX
    MOV BX, 0000H
    MOV AH, DS:[BX]
    MOV BX, 0001H
    MOV AL, DS:[BX]
    
    ADD AL, AH
    LAHF
    AND AH, 10H
    JNZ L4
    
L3: MOV AH, 02
    MOV DL, 'N'
    INT 21H
    JMP L5

L4: MOV AH, 02
    MOV DL, 'Y'
    INT 21H

L5: HLT
    
    


ret





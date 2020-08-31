
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

L1: NOP

L2: MOV AX, 0000H
    MOV DS, AX
    MOV BX, 0000H
    MOV AX, DS:[BX]
    MOV BX, 0002H
    MOV CX, DS:[BX]
    
    ADD AX, CX
    
    JO L4

L3: MOV CX, AX
    JMP L5 
    
L4: MOV DX, AX

L5: HLT
    
    


ret





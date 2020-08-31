
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
    MOV BX, 0002H
    MOV CL, DS:[BX]

L3: CMP AL, AH
    JGE L5
    
L4: CMP AH, CL
    JGE L8
    JMP L9
    
L5: CMP AL, CL
    JGE L7
    JMP L9

L6: MOV AH, 02
    MOV DL, 'Y'
    INT 21H

L7: MOV DL, AL
    JMP L10

L8: MOV DL, AH
    JMP L10

L9: MOV DL, CL

L10: HLT
    
    


ret





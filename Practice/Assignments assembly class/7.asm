org 100h

L1: NOP 

L2: MOV AX, 0F000H
    MOV DS, AX
    MOV BX, 0FFFFH
    MOV AL, BYTE PTR DS:[BX]
    
L3: MOV CX, 00000H
    MOV DS, CX
    MOV BX, 00000H
    MOV AH, BYTE PTR DS:[BX]

L4: SUB AL, AH

L5: JNS L7

L6: OUT 00H, AL
    JMP L8
    
L7: MOV DX, 0FFFFH 
    OUT DX, AL

L8: HLT

ret
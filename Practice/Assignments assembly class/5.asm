org 100h

L1: NOP

L2: MOV AX, 0000H
    MOV DS, AX
    MOV BX, 0000H
    MOV CL, BYTE PTR DS:[BX]
    INC BX
    MOV CH, BYTE PTR DS:[BX]
    INC BX
    MOV AL, BYTE PTR DS:[BX]
    
L3: MOV DX, 0000H
    OUT DX, AL
    MOV AL, CL
    INC DX
    OUT DX, AL
    MOV AL, CH
    INC DX
    OUT DX, AL

L4: HLT
    
ret
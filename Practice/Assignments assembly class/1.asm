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

L4: ADD AH, AL
    
L5: MOV CX, 0F000H
    MOV DS, CX 
    MOV BX, 0FFFEH
    MOV BYTE PTR DS:[BX], AH

L6: HLT

ret




org 100h

L1: NOP

L2: MOV DX, 0FFFFH
    IN AL, DX
    MOV CL, AL
    
L3: MOV DX, 0000H
    IN AL, DX
    MOV CH, AL
    
L4: ADD CL, CH

L5: MOV AL, CL
    OUT 0FEH, AL

L6: HLT
    
ret





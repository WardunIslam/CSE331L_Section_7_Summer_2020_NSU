org 100h

L1: NOP 

L2: MOV AL, 9FH
    MOV CL, 04H
    ROL AL, CL 

L3: HLT

ret
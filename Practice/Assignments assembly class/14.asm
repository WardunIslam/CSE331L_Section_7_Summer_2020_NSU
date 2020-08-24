org 100h

L1: NOP 

L2: MOV AL, 99H
    MOV BH, AL 
    
L3: MOV BL, 02H
    MUL BL
    MOV AL, BH
    MOV BL, 04H
    MUL BL
    MOV AL, BH
    MOV BL, 08H
    MUL BL
    MOV AL, BH
    MOV BL, 10H
    MUL BL
    
L4: HLT

ret
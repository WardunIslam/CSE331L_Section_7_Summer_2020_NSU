org 100h

L1: NOP 

L2: MOV AX, 100
    MOV CX, AX 
    
L3: MOV BL, 02H
    DIV BL
    MOV AX, CX
    MOV BL, 04H
    DIV BL
    MOV AX, CX
    MOV BL, 08H
    DIV BL
    MOV AX, CX
    MOV BL, 10H
    DIV BL
    
L4: HLT

ret
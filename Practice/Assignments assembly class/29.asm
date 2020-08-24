org 100h

L1: NOP 

L2: MOV AL, -1
    MOV AH, 01 
    
L3: ADD AL, AH
    CMP AL, 00H
    JZ ZERO
    
NZERO: MOV DH, AL
       JMP L4

ZERO: MOV DL, AL
    
    
L4: HLT

ret
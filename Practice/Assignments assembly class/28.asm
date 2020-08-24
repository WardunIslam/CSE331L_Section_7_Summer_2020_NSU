org 100h

L1: NOP 

L2: MOV AL, 99H
    MOV DL, AL
    MOV BL, 0FH
    AND AL, BL
    MOV DH, AL
    MOV AL, DL
    MOV CL, 04H
    ROL AL, CL
    MOV BL, 0FH
    AND AL, BL 
    
L3: CMP AL, DH
    JZ EQUAL
    
NOTEQUAL: MOV AH, 02
            MOV DL, 'N'
            INT 21H
            JMP L4

 
EQUAL:  MOV AH, 02
        MOV DL, 'E'
        INT 21H

L4: HLT

ret
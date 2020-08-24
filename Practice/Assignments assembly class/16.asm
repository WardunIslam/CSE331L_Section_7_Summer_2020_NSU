org 100h

L1: NOP 

L2: MOV AL, 9FH
    MOV BL, 0FH
    AND AL, BL 
    
L3: CMP AL, 09H
    JG GREATER
    
NOTGREATER: MOV AH, 02
            MOV DL, 'N'
            INT 21H
            JMP L4

 
GREATER: MOV AH, 02
         MOV DL, 'G'
         INT 21H

L4: HLT

ret
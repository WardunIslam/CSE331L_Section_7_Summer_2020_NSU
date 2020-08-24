org 100h

L1: NOP 

L2: MOV AX, 0000H
    MOV DS, AX
    MOV BX, 0000H
    MOV CL, BYTE PTR DS:[BX] 
    MOV AL, CL

L3: MOV AH, 0000H
    MOV BL, 02H
    DIV BL

L4: CMP AH, 00H
    JZ EVEN

ODD: MOV AH, 02
     MOV DL, 'O'
     INT 21H
     JMP L5
    
EVEN: MOV AH, 02
      MOV DL, 'E'
      INT 21H

L5: HLT

ret
org 100h

L1: NOP

L2: IN AL, 00H
    MOV AH, AL

L3: IN AL, 01H

L4: ADD AL, AH

L5: MOV CX, 0F000H 
    MOV DS, CX
    MOV BX, 0FFFFH
    MOV BYTE PTR DS:[BX], AL  
    
L6: HLT 

ret





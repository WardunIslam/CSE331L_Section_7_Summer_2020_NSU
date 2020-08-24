org 100h
 
L1: MOV AL, 0FH
    MOV BH, AL
    MOV CL, 08H
    MOV DL, 00H
    MOV BL, 02H

LOOP: MOV AL, DL
      MUL BL
      MOV DL, AL
      RCR BH, 01H
      JC CR
      DEC CL
      JNZ LOOP 
      JMP L2  
      
CR: INC DL
    DEC CL
    JNZ LOOP
    
L2: CMP BH, DL
    JZ PALINDROME
    
NOTPALINDROME: MOV AH, 02
               MOV DL, 'N'
               INT 21H
               JMP L3

PALINDROME: MOV AH, 02
            MOV DL, 'P'
            INT 21H


L3: HLT
  
ret
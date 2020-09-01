
.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB 'Enter an integer less than 9: $'
    PROMPT_2 DB 0AH, 0DH, 'The number is : $'

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, PROMPT_1
        MOV AH, 09H
        INT 21H 
        
        MOV AH, 01H 
        INT 21H
        SUB AL, 30H
        
        MOV CL, 02H
        
        MOV AH, 00H
        MOV BX, AX

@LOOP: DIV CL
       CMP AH, 0H
       JE @NOTX
       INC CL
       MOV AX, BX
       CMP CL, BL
       JL @LOOP

       
       LEA DX, PROMPT_2
       MOV AH, 09H
       INT 21H
       MOV AH, 02
       MOV DL, 'X'
       INT 21H
       JMP @END  
       

@NOTX: LEA DX, PROMPT_2
       MOV AH, 09
       INT 21H
       MOV AH, 02H
       MOV DL, 'X'
       INT 21H
       MOV DL, "'"
       INT 21H
       
@END: HLT        
        
        
    MAIN ENDP
END MAIN
        
        
        
.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB 'Enter the first binary number ( max 8-digits ) : $'
    PROMPT_2 DB 'Enter the second binary number ( max 8-digits ) : $'
    PROMPT_3 DB 'The SUM of given binary numbers in binary form is : $'
    ILLEGAL DB 'Illegal character. Try again.$'

.CODE:
    MAIN PROC
       MOV AX, @DATA
       MOV DS, AX
       JMP @INPUT1
       
@ERROR1:
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        MOV AH, 09H
        LEA DX, ILLEGAL
        INT 21H
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H 

@INPUT1:
       
       MOV AH, 09H
       LEA DX, PROMPT_1
       INT 21H 
       
       MOV AH, 01H
       MOV CX, 08H
       MOV BL, 00H
       
@INP1: 
       INT 21H
       
       CMP AL, 0DH
       JE @CHECKC1
       JMP @L1
       
@CHECKC1:
       CMP CX, 08H
       JE @ERROR1
       JMP @INPUT2
@L1:       
       CMP AL, '0'
       JL @ERROR1
       
       CMP AL, '1'
       JG @ERROR1
       
       AND AL, 01H
       SHL BL, 01H
       OR BL, AL
       
       LOOP @INP1
       JMP @INPUT2
       
@ERROR2:
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        MOV AH, 09H
        LEA DX, ILLEGAL
        INT 21H
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H 

@INPUT2:
       MOV AH, 02H
       MOV DL, 0DH
       INT 21H
       MOV DL, 0AH
       INT 21H
       MOV AH, 09H
       LEA DX, PROMPT_2
       INT 21H 
       
       MOV AH, 01H
       MOV CX, 08H
       MOV BH, 00H
       
@INP2: 
       INT 21H  
       
       CMP AL, 0DH
       JE @CHECKC2
       JMP @L2
       
@CHECKC2:
       CMP CX, 08H
       JE @ERROR2
       JMP @CALC 
       
@L2:       
       CMP AL, '0'
       JL @ERROR2
       
       CMP AL, '1'
       JG @ERROR2
       
       AND AL, 01H
       SHL BH, 01H
       OR BH, AL
       
       LOOP @INP2
       
@CALC:
       
       MOV AH, 02H
       MOV DL, 0DH
       INT 21H
       MOV DL, 0AH
       INT 21H
       MOV AH, 09H
       LEA DX, PROMPT_3
       INT 21H
       

       ADD BL, BH
       JNC @PRINT
       MOV AH, 02H
       MOV DL, '1'
       INT 21H
       
       
@PRINT:
       MOV CX, 08H
       
@NCO:  SHL BL, 01H
       JC @ONE
       MOV AH, 02H
       MOV DL, '0'
       INT 21H
       LOOP @NCO
       JMP @END 
       
@ONE:  MOV AH, 02H
       MOV DL, '1'
       INT 21H
       LOOP @NCO
       
@END:
       MOV AH, 4CH
       INT 21H    
       
       
       
   MAIN ENDP
END MAIN
        
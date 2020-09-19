.MODEL SMALL
.STACK 100H

.DATA
    PROMPT DB 'Enter the letter : $'
    MSG_1 DB 'The input letter is: $'
    MSG_2 DB 'The input is not letter!$'
    MSG_3 DB "'Uppercase'$"
    MSG_4 DB "'Lowercase'$"

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        JMP @INPUT
        
@ERROR_PRINT:
        CALL NEWLINE
        MOV AH, 09H
        MOV DX, OFFSET MSG_2
        INT 21H
        CALL NEWLINE
        
@INPUT:         
        MOV AH, 09H
        LEA DX, PROMPT
        INT 21H
        MOV AH, 01H
        INT 21H
        
        CMP AL, 41H
        JL @ERROR_PRINT
        CMP AL, 5AH
        JLE @UPPERCASE
        
        CMP AL, 61H
        JL @ERROR_PRINT
        CMP AL, 7AH
        JLE @LOWERCASE
        
@UPPERCASE:
        MOV BX, OFFSET MSG_3
        JMP @DISPLAY

@LOWERCASE:
        LEA BX, MSG_4

@DISPLAY: 
        CALL NEWLINE
        MOV AH, 09H
        MOV DX, OFFSET MSG_1
        INT 21H
        MOV DX, BX
        INT 21H
        
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
               
         

NEWLINE PROC
    
    PUSH AX
    PUSH DX
    
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    POP DX
    POP AX
    
    RET
NEWLINE ENDP

END MAIN
.MODEL SMALL
.STACK 100H

.DATA   
    MSG_1 EQU 'ENTER THE CHARACTER: $'
    MSG_2 EQU 'THE GIVEN CHARACTER IS: $'
    
    PROMPT_1 DB MSG_1
    PROMPT_2 DB MSG_2 
    
    CHAR DB ?

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H
        LEA DX, PROMPT_1
        INT 21H
        
        MOV AH, 01H
        INT 21H
        
        MOV CHAR, AL
        
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        MOV AH, 09H
        LEA DX, PROMPT_2
        INT 21H
        
        MOV AH, 02H
        MOV DL, CHAR
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN
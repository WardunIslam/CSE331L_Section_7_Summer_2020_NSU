.MODEL SMALL
.STACK 100H

.DATA  
    PROMPT_1 DB 'Enter a String: $'
    PROMPT_2 DB 0DH, 0AH, 'The String is: $'
    
    STR DB 100 DUP(' ')
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H
        MOV DX, OFFSET PROMPT_1
        INT 21H
        
        MOV AH, 01H 
        MOV SI, OFFSET STR
        
@INPUT: INT 21H
        CMP AL, 0DH
        JE @ENDINP
        MOV [SI], AL
        INC SI
        JMP @INPUT 
        
@ENDINP:
        MOV [SI], '$'
        
@OUTPUT:
        MOV AH, 09H
        MOV DX, OFFSET PROMPT_2
        INT 21H
        MOV DX, OFFSET STR
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN

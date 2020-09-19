.MODEL SMALL
.STACK 100H

.DATA
    PROMPT DB 'COUNTING FROM 0-9: $'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H
        MOV DX, OFFSET PROMPT
        INT 21H
        
        MOV AH, 02H
        MOV DL, '0'

COUNT:  INT 21H
        PUSH DX
        MOV DL, ' '
        INT 21H
        POP DX
        INC DL
        CMP DL, ':'
        JNE COUNT 
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN
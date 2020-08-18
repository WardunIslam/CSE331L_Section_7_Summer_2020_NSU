.MODEL SMALL
.STACK 100H

.DATA
    INPUT_MSG DB 'ENTER YOUR STRING: $'
    OUTPUT_MSG DB 'YOU ENTERED: $'
    END_CHAR DB '$'
    STRING DB ?
    
.CODE 
     MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV DX, OFFSET INPUT_MSG
        MOV AH, 09H
        INT 21H
        
        MOV SI, OFFSET STRING

INPUT:  MOV AH, 01H
        INT 21H
        
        MOV [SI], AL
        
        INC SI
        
        CMP AL, 0DH
        
        JNZ INPUT
        
        MOV AL, END_CHAR
        MOV [SI], AL
        
OUTPUT: MOV AH, 02
        MOV DL, 0AH
        INT 21H
        
        MOV DL, 0DH
        INT 21H
        
        MOV DX, OFFSET OUTPUT_MSG
        MOV AH, 09H
        INT 21H
          
        MOV DX, OFFSET STRING
        INT 21H
        
        MOV AH, 02
        MOV DX, 0AH
        INT 21H
        
        MOV AH, 01H
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN
        
    
    
.MODEL SMALL
.STACK 100H

.DATA
    INPUT_MSG DB 'Enter the input: $'
    OUTPUT_MSG DB 'The output is: $'
    SYS DB '$'
    STRING DB ?

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, INPUT_MSG
        MOV AH, 09H
        INT 21H
        
        MOV SI, OFFSET STRING
        
INPUT:  MOV AH, 01H
        INT 21H
        MOV [SI], AL
        INC SI
        CMP AL, 0DH
        JNZ INPUT 
        MOV AL, SYS
        MOV [SI], AL
           
OUTPUT: MOV AH, 02H
        MOV DL, 0AH
        INT 21H
        
        MOV DL, 0DH
        INT 21H
        
        MOV AH, 09H
        MOV DX, OFFSET OUTPUT_MSG
        INT 21H
        
        MOV DX, OFFSET STRING
        INT 21H
        
RETURN: MOV AH, 4CH
        INT 21H
           
        
    MAIN ENDP
END MAIN





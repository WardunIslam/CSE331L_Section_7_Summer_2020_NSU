.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB 'Digits: $'
    PROMPT_2 DB 'Sum: $'
    GAP DB 0AH, 0DH, '        $'
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H
        LEA DX, PROMPT_1
        INT 21H
        
        MOV CL, '0'
        MOV BL, 00H
        MOV AH, 02H
        
@L1:    MOV DL, CL
        ADD BL, CL
        SUB BL, 30H
        INT 21H
        MOV AH, 09H
        LEA DX, GAP
        INT 21H
        MOV AH, 02H
        INC CL
        CMP CL, ':'
        JNE @L1
        
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV AH, 09H
        LEA DX, PROMPT_2
        INT 21H
        
        MOV AL, BL
        MOV AH, 00H
        MOV CL, 10
        DIV CL
        MOV BX, AX
        
        MOV AH, 02H
        MOV DL, BL
        ADD DL, 30H
        INT 21H
        
        MOV DL, BH
        ADD DL, 30H
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    
    MAIN ENDP
END MAIN
        
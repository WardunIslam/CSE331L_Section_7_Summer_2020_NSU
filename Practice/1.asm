


.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB 'Enter the First digit : $\'
    PROMPT_2 DB 'Enter the Second digit : $\'
    PROMPT_3 DB 'Mul of First and Second digit : $\'
    
    DATA_1 DB ?
    DATA_2 DB ?

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
        MOV DATA_1, AL
        
        MOV AH, 02H
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        LEA DX, PROMPT_2
        MOV AH, 09H
        INT 21H
        
        MOV AH, 01H
        INT 21H
        SUB AL, 30H
        MOV DATA_2, AL
        
        MOV AH, 02H
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        LEA DX, PROMPT_3
        MOV AH, 09H
        INT 21H
        
        MOV AL, DATA_1
        MOV BL, DATA_2
        MUL BL
        mov DL, AL
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        
        
        
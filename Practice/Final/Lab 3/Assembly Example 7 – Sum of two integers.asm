.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB 'Enter the First digit : $'
    PROMPT_2 DB 'Enter the Second digit : $'
    PROMPT_3 DB 'Sum of First and Second digit : $'
    
    VALUE_1 DB ?
    VALUE_2 DB ?
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H
        LEA DX, PROMPT_1
        INT 21H  
        
        MOV AH, 01H
        INT 21H    
        SUB AL, 30H
        LEA BX, VALUE_1
        MOV [BX], AL
        
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        MOV AH, 09H
        LEA DX, PROMPT_2
        INT 21H
        
        MOV AH, 01H 
        INT 21H
        LEA BX, VALUE_2
        SUB AL, 30H
        MOV [BX], AL
         
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H 
        MOV DL, 0AH
        INT 21H
        
        MOV AH, 09H
        LEA DX, PROMPT_3
        INT 21H
        
        MOV AL, VALUE_1
        ADD AL, VALUE_2
        MOV AH, 00H
        AAA
        MOV BL, AL 
        MOV BH, AH
        
        MOV AH, 02H
        MOV DL, BH
        ADD DL, 30H
        INT 21H
        MOV AH, 02H
        MOV DL, BL
        ADD DL, 30H
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN
        
         
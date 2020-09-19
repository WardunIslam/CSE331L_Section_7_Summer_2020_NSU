;Assembly Example 1 – Print 2 strings

.MODEL SMALL
.STACK 100H

.DATA
    STRING_1 DB 'I HATE CSE311$'
    STRING_2 DB 'BUT I LOVE LACCHI!!!$'

.CODE        
    MAIN PROC 
        
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, STRING_1
        MOV AH, 09H
        INT 21H
        
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        
        MOV DL, 0AH
        INT 21H
        
        MOV AH, 09H
        MOV DX, OFFSET STRING_2
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN
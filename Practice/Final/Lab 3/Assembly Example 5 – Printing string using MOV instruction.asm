.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'HELLO "WORLD" ', "HOW ARE 'YOU'?$"

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H
        MOV DX, OFFSET MSG
        INT 21H
        
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END MAIN
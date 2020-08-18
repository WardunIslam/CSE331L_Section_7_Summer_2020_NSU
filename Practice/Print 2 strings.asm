.MODEL SMALL
.STACK 100H


.DATA
    MSG1 DB 'I HATE CSE331$'
    MSG2 DB 'BUT I LOVE KACCHI!!!$'

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, MSG1
        MOV AH, 09H
        INT 21H    
        
        MOV DL, 0AH 
        MOV AH, 02
        INT 21H
              
        MOV DL, 0DH
        INT 21H
        
        LEA DX, MSG2
        MOV AH, 09
        INT 21H
        
        MOV AH, 01
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN
    





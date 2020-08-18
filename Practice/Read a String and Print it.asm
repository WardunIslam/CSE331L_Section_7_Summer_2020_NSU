.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'Enter a character: $'
    MSG2 DB 0AH, 0DH, 'You entered:$'

.CODE
    MAIN PROC 
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, MSG1
        MOV AH, 09H
        INT 21H
        
        MOV AH, 01H
        INT 21H
        
        MOV CL, AL
        
        LEA DX, MSG2
        MOV AH, 09H
        INT 21H
        
        MOV AH, 02
        MOV DL, 20H
        INT 21H
        
        MOV DL, CL
        MOV AH, 02
        INT 21H   
        
        MOV AH, 01H
        INT 21H
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN
        
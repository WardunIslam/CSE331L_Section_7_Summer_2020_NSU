.MODEL SMALL
.STACK 100H 

.DATA
    PROMPT DB 'The counting from 0 to 9 is : $'

.CODE
    MAIN PROC
       
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09H
    MOV DX, OFFSET PROMPT
    INT 21H
    
    MOV CX, 10
    MOV AH, 02H
    
    MOV DL, '0'
    
    LOOP:
        INT 21H
        
        MOV BL,DL
        
        MOV DL, 20H
        INT 21H 
        
        MOV DL, BL
         
        INC DL
        DEC CX
        JNZ LOOP
   
    MOV AH, 01
    INT 21H    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN
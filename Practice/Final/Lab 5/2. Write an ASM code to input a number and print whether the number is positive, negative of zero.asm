.MODEL SMALL
.STACK 100H

.DATA
    PROMPT DB 'Enter the digit : $'
    MSG DB 'The entered digit is : $'  
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H
        MOV DX, OFFSET PROMPT
        INT 21H 
                
        MOV AH, 01H
        INT 21H
        SUB AL, 30H
        MOV BL, AL
        
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H 

        
        MOV AH, 09H
        MOV DX, OFFSET MSG
        INT 21H
        
        CMP BL, 00H
        JZ @ZERO
        JG @POSITIVE
        JL @NEGETIVE

@ZERO:  MOV AH, 02H
        MOV DL, 'Z'
        INT 21H
        JMP @END

@POSITIVE:
        MOV AH, 02H
        MOV DL, 'P'
        INT 21H
        JMP @END

@NEGETIVE:
        MOV AH, 02H
        MOV DL, 'N'
        INT 21H

@END:   MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END MAIN

        
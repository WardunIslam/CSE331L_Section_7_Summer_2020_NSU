.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB 'Enter the binary number (max 8-bit) : $'
    PROMPT_2 DB 'The given binary number in reverse order is : $'
    PROMPT_3 DB 'The input is not an binary number!$'
    
.CODE:
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        JMP @INPUT 

@ERROR: 
        CALL NEWLINE
        MOV AH, 09H
        LEA DX, PROMPT_3
        INT 21H
        CALL NEWLINE              
               
@INPUT: MOV BL, 00H
        MOV CX, 08H
        MOV AH, 09H
        LEA DX, PROMPT_1
        INT 21H
        MOV AH, 01H           
                   
@L1:    INT 21H
        CMP AL, 30H
        JL @ERROR
        CMP AL, 31H
        JG @ERROR
        SHL BL, 01H
        AND AL, 01H
        OR BL, AL
        LOOP @L1
        
        MOV CX, 08H
        MOV AL, BL
        
@L2:    SHL AL, 01H
        RCR BL, 01H
        LOOP @L2
        
        CALL NEWLINE
        MOV AH, 09H
        LEA DX, PROMPT_2
        INT 21H
        MOV CX, 08H
        MOV AH, 02H
        
@PRINT: SHL BL, 01H
        JC @ONE
        MOV DL, '0'
        INT 21H
        LOOP @PRINT
        
@ONE:   MOV DL, '1'
        INT 21H
        LOOP @PRINT
        
        MOV AH, 4CH
        INT 21H        
        
        
        
    MAIN ENDP
    
              
              
              
    NEWLINE PROC
        PUSH AX
        PUSH DX
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        POP DX
        POP AX
        RET
    NEWLINE ENDP
        
    
END MAIN
        
        
        
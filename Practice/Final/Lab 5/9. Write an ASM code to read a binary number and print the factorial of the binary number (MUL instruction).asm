.MODEL SMALL
.STACK 100H

.DATA
   PROMPT_1 DB 'Enter a Positive Binary number (max. 1000) : $'
   PROMPT_2 DB 0AH, 0DH, 'The Factorial of the given number is : $'
   ILLEGAL DB 0AH, 0DH, 'Illegal character. Try again.$'  
   
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        JMP @INPUT
        
@ERROR: MOV AH, 09H
        LEA DX, ILLEGAL
        INT 21H
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H

@INPUT: MOV AH, 09H
        LEA DX, PROMPT_1
        INT 21H
        MOV CX, 04H
        MOV AH, 01H
        MOV BL, 00H
        
@INP1:  INT 21H
        CMP AL, 0DH
        JE @L1
        CMP AL, '0'
        JL @ERROR
        CMP AL, '1'
        JG @ERROR
        JMP @L2
        
@L1:    CMP CX, 04H
        JE @ERROR
        JL @CALC
            
@L2:    SHL BL, 01H
        AND AL, 01H
        OR BL, AL
        LOOP @INP1
        
        

@CALC:  
        CMP BL, 09H
        JGE @ERROR
        CMP BL, 00H
        JL @ERROR
        JE @ZERO
        MOV CL, BL
        MOV CH, 00H
        MOV AX, 0001H
        

        
@L3:    MUL CX
        LOOP @L3 
        
        JMP @OUTPUT
        
@ZERO:
        MOV AX, 0000H
        JMP @OUTPUT
        
@OUTPUT:
        MOV BX, AX
        MOV AH, 09H
        LEA DX, PROMPT_2
        INT 21H
        MOV CX, 10H 
        
@L4:    SHL BX, 01H
        JC @ONE
        MOV DL, '0'
        JMP @DISPLAY 
        
@ONE:   MOV DL, '1'

@DISPLAY:
        MOV AH, 02H
        INT 21H
        LOOP @L4
        
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END MAIN
 
        
        
        
            
    
     
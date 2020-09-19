.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB 'Enter the string: $'
    MSG_1 DB ' is Palindrome.$'
    MSG_2 DB ' is not Palindrome.$'
    
    STR DB 100 DUP(' ')
    STR2 DB 100 DUP(' ')
    COUNT DW ?
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
@ERROR: 
        MOV AH, 09H
        LEA DX, PROMPT_1
        INT 21H
        
        MOV AH, 01H
        LEA SI, STR
        MOV CX, 0000H 
        
@INPUT:
        INT 21H        
        CMP AL, 0DH 
        JE @CHECKCOUNT
        JMP @L1
        
@CHECKCOUNT:
        CMP CX, 00H
        JNE @EXIT
        JMP @ERROR
        
@L1:
        MOV [SI], AL
        INC CX 
        INC SI
        JMP @INPUT                                  
        
        
@EXIT:  MOV [SI], '$'

        MOV COUNT, CX
        DEC SI
        LEA DI, STR2
        

        
@LOOP2:
        MOV DL, [SI]
        MOV [DI], DL
        INC DI 
        DEC SI
        LOOP @LOOP2 
        
        LEA SI, STR
        LEA DI, STR2
        MOV CX, COUNT
        
@LOOP3: 
        MOV AL, [SI] 
        CMP AL, [DI]
        JNE @NOTPALINDROME
        LOOP @LOOP3
        
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        MOV AH, 09H
        LEA DX, STR
        INT 21H
        MOV AH, 09H
        LEA DX, MSG_1
        INT 21H 
        JMP @ENDPROG
        
 @NOTPALINDROME: 
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        MOV AH, 09H
        LEA DX, STR
        INT 21H
        MOV AH, 09H
        LEA DX, MSG_2
        INT 21H 

@ENDPROG:
        MOV AH, 4CH
        INT 21H
        
        
        
    MAIN ENDP
END MAIN
                
        
        
        
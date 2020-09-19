.MODEL SMALL
.STACK 100H

.DATA 

    STRING DB ?
    SYM DB '$'
      
    INPUT_MSG DB 'ENTER THE INPUT: $'
    OUTPUT_MSG DB 'THE OUTPUT IS: $'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H
        MOV DX, OFFSET INPUT_MSG
        INT 21H   
        
        LEA SI, STRING
        MOV AH, 01H 
        
INPUT:  INT 21H   
        MOV [SI], AL
        INC SI
        CMP AL, 0DH
        JNE INPUT
        
        LEA BX, SYM
        MOV AL, [BX]
        MOV [SI], AL
        
        MOV AH, 02H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H

        MOV AH, 09H
        MOV DX, OFFSET OUTPUT_MSG
        INT 21H
        
                
        MOV DX, OFFSET STRING 
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN
        
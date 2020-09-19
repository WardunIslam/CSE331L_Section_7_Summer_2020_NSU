.MODEL SMALL
.STACK 100H

.DATA
    A DB 1,2,3,4,5,6,7,8,9,0
    B DB DUP(0)
    
.CODE
    MAIN PROC
       
       MOV AX, @DATA
       MOV DS, AX
       
       LEA SI, A
       LEA BX, B
       
       MOV CX, 0AH 
       
L1:    MOV AL, BYTE PTR[SI]
       MOV BYTE PTR [BX], AL
       INC BX
       INC SI
       LOOP L1 
       
       MOV SI, OFFSET B
       MOV CX, 0AH

L2:    MOV AH, 02H
       MOV DL, BYTE PTR DS:[SI] 
       ADD DL, 30H
       INT 21H
       MOV DL, ' '
       INT 21H
       INC SI
       LOOP L2
      
      
       MOV AH, 4CH
       INT 21H
       
   MAIN ENDP
END MAIN
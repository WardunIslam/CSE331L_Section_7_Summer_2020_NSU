DATA SEGMENT
    MSG DB 'HELLO WORLD!$'
ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
START:
     MOV AX, DATA
     MOV DS, AX
     
     LEA DX, MSG
     
     MOV AH, 09H
     INT 21H   
     
     MOV AH, 01
     INT 21H
     
     MOV AH, 4CH
     INT 21H
ENDS
END START
    





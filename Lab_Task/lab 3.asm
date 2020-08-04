
DATA SEGMENT
    MSG1 DB "Hello World$" 
    MSG2 DB "Assembly LAnguage CSE331#"
    
START:
    MOV AX, DATA
    MOV DS, AX
    LEA DX, MSG1
     
    MOV AH, 9
    INT 21H 
    
    MOV AX, DATA
    MOV DS, AX
    LEA DX, MSG2
     
    MOV AH, 9
    INT 21H
    
    MOV AH, 4cH
    INT 21H
      
    
END START
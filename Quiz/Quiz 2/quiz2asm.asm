
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

a DB 20 DUP(2)          
MOV AL, a[0]
ADD AL, a[2]
ADD AL, a[4] 
ADD AL, a[6] 
ADD AL, a[8] 
ADD AL, a[10] 
ADD AL, a[12] 
ADD AL, a[14] 
ADD AL, a[16] 
ADD AL, a[18] 
ret






; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

c1 EQU 01
c2 EQU 02

MOV AX, c1
ADD AX, c2
ADD AX, c2
ADD AX, c1

ret





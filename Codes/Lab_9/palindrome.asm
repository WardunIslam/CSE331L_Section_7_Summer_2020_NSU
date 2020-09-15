
DATA SEGMENT
    str1 db 'Class','$'
    strlen1 dw $-str1
    strrev db 20 dup('')
    str_palin db 'String is Palindrome.','$'
    str_not_palin db 'String is not Palindrome.','$'
DATA ends

CODE SEGMENT
    Assume cs:code, ds:data
BEGIN:
 mov ax, data
 mov ds, ax
 mov es, ax
 mov cx, strlen1
 add cx, -2
 
 lea si, str1
 lea di, strrev
 
 add si, strlen1
 add si, -2
 
L1:
 mov al, [si]
 mov [di], al
 dec si
 inc di
 LOOP L1

 mov al, [si]
 mov [di], al
 inc dl

 mov dl, '$'
 mov [di], dl
 mov cx, strlen1

Palin_Check:
  lea si, str1
  lea di, strrev
  repe cmpsb
  jne Not_Palin

Palin:
  mov ah, 09h
  lea dx, str_palin
  int 21h
  jmp exit
  
Not_Palin:
  mov ah, 09h
  lea dx, str_not_palin
  int 21h
exit:
  mov ax, 4c00h
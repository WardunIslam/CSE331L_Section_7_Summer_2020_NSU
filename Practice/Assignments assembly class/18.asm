org 100h

L1: NOP 

SETMSB: MOV BL, 0FH
        OR BL, 080H
SETLSB: MOV BL, 0FH
        OR BL, 01H

L3: HLT

ret





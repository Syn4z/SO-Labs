org 0x7C00      

jmp _display           

section .text
    msg db "Sorin", 0

_display:
    mov SP, 0x7C00 
    mov AX, 1300h
    mov BL, 0x04 
    mov DH, 0  
    mov DL, 0      
    mov BP, msg     
    mov CX, 6     
    int 10h 
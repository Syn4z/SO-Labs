go:
    mov AH, 0Ah    ; Set AH register to 0x0A (function code for reading a character with echo).
    mov AL, 'O'    ; Set AL register to the ASCII code of the character 'O'.
    mov CX, 1      ; Set CX register to 1, indicating we want to read one character.
    int 10H        ; Call interrupt 10H, which is responsible for video services.

go:
    mov AH, 0x0E    ; Set AH register to 0x0E (function code for displaying a character).
    mov AL, 'S'     ; Set AL register to the ASCII code of the character 'S'.
    int 0x10        ; Call interrupt 0x10, which is responsible for video services.

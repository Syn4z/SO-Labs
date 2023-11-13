_print:
    mov AH, 09h  ; Set AH register to 09h (function code for displaying a character).
    mov AL, 'R'  ; Set AL register to the ASCII code of the character 'R'.
    mov BL, 12   ; Set BL register to 12 (number of times to display the character).
    int 10h      ; Call interrupt 10h, which is responsible for video services.

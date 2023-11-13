_print:
    mov AH, 09h  ; Set AH register to 09h (function code for displaying a character).
    mov AL, 'I'  ; Set AL register to the ASCII code of the character 'I'.
    mov BL, 9    ; Set BL register to 9, indicating the number of times to display the character 'I'.
    mov CX, 1    ; Set CX register to 1, which specifies that we want to print the character 'I' one time.
    int 10h      ; Call interrupt 10h, which is responsible for video services.

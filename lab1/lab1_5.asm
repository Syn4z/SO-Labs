_display:
    mov AH, 09h  ; Set AH register to 09h (function code for displaying a character).
    mov AL, 'N'  ; Set AL register to the ASCII code of the character 'N'.
    mov BL, 10   ; Set BL register to 10, indicating the number of times to display the character 'N'.
    mov CX, 1    ; Set CX register to 1, specifying that we want to display the character 'N' once.
    int 10h      ; Call interrupt 10h, which is responsible for video services.
   
    mov AH, 02h  ; Set AH register to 02h (function code for setting cursor position).
    mov BH, 0    ; Set BH register to 0, indicating the page number (usually the default page).
    mov DH, 0    ; Set DH register to 0, specifying the row for the cursor (usually the first row, zero-based).
    mov DL, 1    ; Set DL register to 1, specifying the column for the cursor (usually the second column, zero-based).
    int 10h      ; Call interrupt 10h, which is responsible for video services.

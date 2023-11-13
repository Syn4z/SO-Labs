org 0x7C00  ; Set the origin address for the code to 0x7C00, which is the standard boot sector address.

jmp _display  ; Jump to the _display label to start the code execution.

section .text
msg db "Sorin", 0  ; Define a null-terminated string "Sorin" in the .text section.

_display:
    mov SP, 0x7C00  ; Set the stack pointer to the boot sector address (0x7C00).
    mov AX, 1301h   ; Set the AX register to 1301h, update the cursor.
    mov BL, 0x04    ; Set the BL register to 0x04.
    mov DH, 0       ; Set the DH register to 0.
    mov DL, 0       ; Set the DL register to 0.
    mov BP, msg     ; Load the address of the "Sorin" string into BP.
    mov CX, 6       ; Set the CX register to 6 (length of the string).
    int 10h         ; Call interrupt 10h, which is typically used for video services.

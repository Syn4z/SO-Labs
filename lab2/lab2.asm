org 0x7c00						

mov AL, 0x3						
mov AH, 0						
int 0x10

mov SI, buffer					
typing:
	mov AH, 0
	int 0x16

	cmp AH, 0x0e				; Backspace key pressed
	je backspace_key
	
	cmp AH, 0x1c				; Enter key pressed
	je enter_key
 
	cmp AL, 0x20				
	jge print_character
 
	jmp typing				; Read from user keyboard inputs


backspace_key:
	cmp SI, buffer				
	je typing					
	dec SI
	mov byte [SI], 0			

	mov AH, 0x03
	mov BH, 0
	int 0x10

	cmp DL, 0					
	jz last_line				; Move cursor to the previous line
	jmp last_character				; Else move the cursor to the previous position of the string
	
last_character:
	mov AH, 0x02
	dec DL
	int 0x10
	jmp overwrite_character

last_line:
	mov AH, 0x02
	mov DL, 79
	dec DH
	int 0x10

overwrite_character:
	mov AH, 0xa					; Overwrite existing character
	mov AL, 0x20				
	mov CX, 1					
	int 0x10
	jmp typing				

enter_key:
	mov AH, 0x03
	mov BH, 0
	int 0x10					

	sub SI, buffer				
	jz insert_line			
	
	mov AH, 0x03				
	mov BH, 0
	int 0x10
	
	cmp DH, 24
	jl print_echo
	
	mov AH, 0x06				
	mov AL, 1
	mov BH, 0x07				
	mov CX, 0					
	mov DX, 0x184f				
	int 0x10
	mov DH, 0x17				
	
print_echo:
	mov BH, 0 					
	mov AX, 0
	mov ES, AX 					
	mov BP, buffer

	mov BL, 60h				; Color black on orange
	mov CX, SI					
	inc DH						
	mov DL, 0					

	mov AX, 0x1301				; Write mode, update cursor
	int 0x10

insert_line:
	cmp DH, 24					
	je scroll_down				

	mov AH, 0x03				
	mov BH, 0
	int 0x10

	jmp move_down				

scroll_down:
	mov AH, 0x06
	mov AL, 1
	mov BH, 0x07				
	mov CX, 0					
	mov DX, 0x184f				
	int 0x10
	mov DH, 0x17				

move_down:
	mov AH, 0x02				
	mov BH, 0
	inc DH
	mov DL, 0
	int 0x10
	
	add SI, buffer

clear_buffer:
	mov byte [SI], 0			
	inc SI
	cmp SI, 0
	jne clear_buffer
	mov SI, buffer
	jmp typing

print_character:
	cmp AL, 0x7f				
	jge typing

	cmp SI, buffer + 256		
	je typing
	mov [SI], AL
	inc SI
	
	mov AH, 0xe					
	int 10h
	jmp typing

buffer: times 256 db 0x0		
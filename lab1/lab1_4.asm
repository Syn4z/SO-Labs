_print:
	mov AH, 09h
	mov AL, 'I'
	mov BL, 9
	mov CX, 1
	int 10h

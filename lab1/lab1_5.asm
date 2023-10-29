_display:
	mov AH, 09h
	mov AL, 'N'
	mov BL, 10
	mov CX, 1
	int 10h

	mov AH, 02h
	mov BH, 0
	mov DH, 0
	mov DL, 1
	int 10h
.zerops:
    mov byte [StringKeyboard], "0"
	jmp .print_keyboard_Char_sector
.oneps:
    mov byte [StringKeyboard], "1"
	jmp .print_keyboard_Char_sector
.twops:
    mov byte [StringKeyboard], "2"
	jmp .print_keyboard_Char_sector
.threeps:
    mov byte [StringKeyboard], "3"
	jmp .print_keyboard_Char_sector
.fourps:
    mov byte [StringKeyboard], "4"
	jmp .print_keyboard_Char_sector
.fiveps:
    mov byte [StringKeyboard], "5"
	jmp .print_keyboard_Char_sector
.sixps:
    mov byte [StringKeyboard], "6"
	jmp .print_keyboard_Char_sector
.sevenps:
    mov byte [StringKeyboard], "7"
	jmp .print_keyboard_Char_sector
.eighthps:
    mov byte [StringKeyboard], "8"
	jmp .print_keyboard_Char_sector
.nineps:
    mov byte [StringKeyboard], "9"
	jmp .print_keyboard_Char_sector
.print_keyboard_Char_sector:
    xor eax, eax
	mov eax, 3992
	cmp [TypePoint], eax
	je .sector_number_typing
    mov esi, StringKeyboard
	mov dl, [StringKeyboard]
	mov [inputNirac + ecx], dl
	inc ecx
	call .printred
	mov al, 0x20
	out 0x20, al
	mov byte [StringKeyboard], 0
	add dword [TypePoint], 2
	jmp .sector_number_typing

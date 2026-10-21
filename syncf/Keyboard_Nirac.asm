

.A_PressedNirac:
    mov byte [StringKeyboard], "a"
	jmp .print_keyboard_Char_Nirac
.B_PressedNirac:
    mov byte [StringKeyboard], "b"
	jmp .print_keyboard_Char_Nirac
.C_PressedNirac:
    mov byte [StringKeyboard], "c"
	jmp .print_keyboard_Char_Nirac
.D_PressedNirac:
    mov byte [StringKeyboard], "d"
	jmp .print_keyboard_Char_Nirac
.E_PressedNirac:
    mov byte [StringKeyboard], "e"
	jmp .print_keyboard_Char_Nirac
.F_PressedNirac:
    mov byte [StringKeyboard], "f"
	jmp .print_keyboard_Char_Nirac
.G_PressedNirac:
    mov byte [StringKeyboard], "g"
	jmp .print_keyboard_Char_Nirac
.H_PressedNirac:
    mov byte [StringKeyboard], "h"
	jmp .print_keyboard_Char_Nirac
.I_PressedNirac:
    mov byte [StringKeyboard], "i"
	jmp .print_keyboard_Char_Nirac
.J_PressedNirac:
    mov byte [StringKeyboard], "j"
	jmp .print_keyboard_Char_Nirac
.K_PressedNirac:
    mov byte [StringKeyboard], "k"
	jmp .print_keyboard_Char_Nirac
.L_PressedNirac:
    mov byte [StringKeyboard], "l"
	jmp .print_keyboard_Char_Nirac
.M_PressedNirac:
    mov byte [StringKeyboard], "m"
	jmp .print_keyboard_Char_Nirac
.N_PressedNirac:
    mov byte [StringKeyboard], "n"
	jmp .print_keyboard_Char_Nirac
.O_PressedNirac:
    mov byte [StringKeyboard], "o"
	jmp .print_keyboard_Char_Nirac
.P_PressedNirac:
    mov byte [StringKeyboard], "p"
	jmp .print_keyboard_Char_Nirac
.Q_PressedNirac:
    mov byte [StringKeyboard], "q"
	jmp .print_keyboard_Char_Nirac
.R_PressedNirac:
    mov byte [StringKeyboard], "r"
	jmp .print_keyboard_Char_Nirac
.S_PressedNirac:
    mov byte [StringKeyboard], "s"
	jmp .print_keyboard_Char_Nirac
.T_PressedNirac:
    mov byte [StringKeyboard], "t"
	jmp .print_keyboard_Char_Nirac
.U_PressedNirac:
    mov byte [StringKeyboard], "u"
	jmp .print_keyboard_Char_Nirac
.V_PressedNirac:
    mov byte [StringKeyboard], "v"
	jmp .print_keyboard_Char_Nirac
.W_PressedNirac:
    mov byte [StringKeyboard], "w"
	jmp .print_keyboard_Char_Nirac
.X_PressedNirac:
    mov byte [StringKeyboard], "x"
	jmp .print_keyboard_Char_Nirac
.Y_PressedNirac:
    mov byte [StringKeyboard], "y"
	jmp .print_keyboard_Char_Nirac
.Z_PressedNirac:
    mov byte [StringKeyboard], "z"
	jmp .print_keyboard_Char_Nirac
.Space_PressedNirac:
    mov byte [StringKeyboard], " "
	jmp .print_keyboard_Char_Nirac
.delete_plsNirac:
    xor eax, eax
	mov eax, 160
	cmp [TypePoint], eax
	je .StartTypingS
    sub dword [TypePoint], 2
	call .setpos
	mov esi, empty
	call .print
	sub edi, 2
	sub ecx, 1
	mov [inputNirac+ecx], 0
	jmp .StartTypingS
.save_pressedNiracS:
	mov dword [DataLine], 3840
	call .setLine
	mov edi, 0xB8F00
	mov ecx, 80
	mov ax, 0x0020
	call .clr
	jmp .setTWords_save_key_Nirac
.setTWords_save_key_Nirac:
    mov dword [DataLine], 3840
	call .setLine
	mov esi, sectorgeter
	call .printwir
	mov dword [DataLine], 160
	call .setLine
	mov dword [TypePoint], 160

	call .setpos
	jmp .sector_number_typing_start
.sector_number_typing_start:
	mov dword [TypePoint], 3878
	call .setpos
	xor ax, ax
	jmp .sector_number_typing
.sector_number_typing:
	in al, 0x64
	test al, 1
	jz .sector_number_typing
	in al, 0x60
	cmp al, 0x0B
	je .zerops
	cmp al, 0x02
	je .oneps
	cmp al, 0x03
	je .twops
	cmp al, 0x04
	je .threeps
	cmp al, 0x05
	je .fourps
	cmp al, 0x06
	je .fiveps
	cmp al, 0x07
	je .sixps
	cmp al, 0x08
	je .sevenps
	cmp al, 0x09
	je .eighthps
	cmp al, 0x0A
	je .nineps
	jmp .sector_number_typing
.xorincCall_Nirac:
    cmp ebx, 32
	je .endXorInputChar_Nirac
	mov [inputNirac+ebx], 0
	inc ebx
	jmp .xorincCall_Nirac
.endXorInputChar_Nirac:
    ret
.print_keyboard_Char_Nirac:
    xor eax, eax
	mov eax, 1840
	cmp [TypePoint], eax
	je .StartTypingS
    mov esi, StringKeyboard
	mov dl, [StringKeyboard]
	mov [inputNirac + ecx], dl
	inc ecx
	call .print
	mov al, 0x20
	out 0x20, al
	mov byte [StringKeyboard], 0
	add dword [TypePoint], 2
	jmp .StartTypingS

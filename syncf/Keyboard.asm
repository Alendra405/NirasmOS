

.A_Pressed:
    mov byte [StringKeyboard], "a"
	jmp .print_keyboard_Char
.B_Pressed:
    mov byte [StringKeyboard], "b"
	jmp .print_keyboard_Char
.C_Pressed:
    mov byte [StringKeyboard], "c"
	jmp .print_keyboard_Char
.D_Pressed:
    mov byte [StringKeyboard], "d"
	jmp .print_keyboard_Char
.E_Pressed:
    mov byte [StringKeyboard], "e"
	jmp .print_keyboard_Char
.F_Pressed:
    mov byte [StringKeyboard], "f"
	jmp .print_keyboard_Char
.G_Pressed:
    mov byte [StringKeyboard], "g"
	jmp .print_keyboard_Char
.H_Pressed:
    mov byte [StringKeyboard], "h"
	jmp .print_keyboard_Char
.I_Pressed:
    mov byte [StringKeyboard], "i"
	jmp .print_keyboard_Char
.J_Pressed:
    mov byte [StringKeyboard], "j"
	jmp .print_keyboard_Char
.K_Pressed:
    mov byte [StringKeyboard], "k"
	jmp .print_keyboard_Char
.L_Pressed:
    mov byte [StringKeyboard], "l"
	jmp .print_keyboard_Char
.M_Pressed:
    mov byte [StringKeyboard], "m"
	jmp .print_keyboard_Char
.N_Pressed:
    mov byte [StringKeyboard], "n"
	jmp .print_keyboard_Char
.O_Pressed:
    mov byte [StringKeyboard], "o"
	jmp .print_keyboard_Char
.P_Pressed:
    mov byte [StringKeyboard], "p"
	jmp .print_keyboard_Char
.Q_Pressed:
    mov byte [StringKeyboard], "q"
	jmp .print_keyboard_Char
.R_Pressed:
    mov byte [StringKeyboard], "r"
	jmp .print_keyboard_Char
.S_Pressed:
    mov byte [StringKeyboard], "s"
	jmp .print_keyboard_Char
.T_Pressed:
    mov byte [StringKeyboard], "t"
	jmp .print_keyboard_Char
.U_Pressed:
    mov byte [StringKeyboard], "u"
	jmp .print_keyboard_Char
.V_Pressed:
    mov byte [StringKeyboard], "v"
	jmp .print_keyboard_Char
.W_Pressed:
    mov byte [StringKeyboard], "w"
	jmp .print_keyboard_Char
.X_Pressed:
    mov byte [StringKeyboard], "x"
	jmp .print_keyboard_Char
.Y_Pressed:
    mov byte [StringKeyboard], "y"
	jmp .print_keyboard_Char
.Z_Pressed:
    mov byte [StringKeyboard], "z"
	jmp .print_keyboard_Char
.Space_Pressed:
    mov byte [StringKeyboard], " "
	jmp .print_keyboard_Char
.Enter_Pressed:
    add dword [DataLine], 90
	call .setLine
	mov esi, OutPutS
	call .print
	
	call .setOutPut
	sub dword [DataLine], 90
	call .setLine
	xor ebx, ebx
	jmp .xorinc
.delete_pls:
    xor eax, eax
    mov eax, [DataLine]
	add eax, 18
	cmp [TypePoint], eax
	je .GetInput
    sub dword [TypePoint], 2
	call .setpos
	mov esi, empty
	call .print
	sub edi, 2
	sub ecx, 1
	mov [inputChar+ecx], 0
	jmp .GetInput
.xorinc:
    cmp ebx, 32
	je .StartNewGetInputStart
	mov [inputChar+ebx], 0
	inc ebx
	jmp .xorinc
.xorincCall:
    cmp ebx, 32
	je .endXorInputChar
	mov [inputChar+ebx], 0
	inc ebx
	jmp .xorincCall
.endXorInputChar:
    ret
.StartNewGetInputStart:
    add dword [DataLine], 160
	xor eax, eax
	mov eax, [DataLine]
	add eax, 18
	mov dword [TypePoint], eax
	call .setLine
	jmp .startNewGetInput

.startNewGetInput:  ;only for enter

    mov esi, getInputPrompt
	call .print
	jmp .GetInput

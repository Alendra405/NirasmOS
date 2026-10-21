[BITS 32]
[ORG 0x7E00]

kernel_start:
    mov edi, 0xb8000
	mov ecx, 2000
	mov ax, 0x0720
    jmp .CLS
.CLS:
    cmp ecx, 0
	je .SetCursor
	mov [edi], ax
	add edi, 2
	sub ecx, 1
	jmp .CLS
.SetCursor:
    mov dx, 0x3D4
	mov al, 0x0F
	out dx, al
	mov dx, 0x3D5
	mov al, [TypePointL]
	out dx, al
	mov dx, 0x3D4
	mov al, 0x0E
	out dx, al
	mov dx, 0x3D5
	mov al, [TypePointH]
	out dx, al
	jmp .print_welcomeS
.print_welcomeS:
    call .setLine
    mov esi, WelcomeMessage
	call .print
	jmp .StartGetInput
.setpos:
    mov edi, [TypePoint]
	add edi, 0xb8000
	ret
.setLine:
    mov edi, [DataLine]
	add edi, 0xb8000
	ret
.print:
    lodsb
	cmp al, 0
	je .EndPrint
    mov [edi], al
	inc edi
	mov byte [edi], 0x0f
	inc edi
	jmp .print
.printgray:
    lodsb
	cmp al, 0
	je .EndPrint
    mov [edi], al
	inc edi
	mov byte [edi], 0x70
	inc edi
	jmp .printgray
.EndPrint:
    ret
.printred:
    lodsb
	cmp al, 0
	je .EndPrint
    mov [edi], al
	inc edi
	mov byte [edi], 0x0C
	inc edi
	jmp .printred
.printwir:
    lodsb
	cmp al, 0
	je .EndPrint
    mov [edi], al
	inc edi
	mov byte [edi], 0x0CF
	inc edi
	jmp .printwir
.StartGetInput:
    add dword [DataLine], 320
	call .setLine
	mov esi, getInputPrompt
	call .print
	xor ecx, ecx
	xor esi, esi
	jmp .GetInput
.GetInput:
    in al, 0x64
    test al, 1
    jz .GetInput
	in al, 0x60
	cmp al, 0x1E
	je .A_Pressed
	cmp al, 0x30
	je .B_Pressed
	cmp al, 0x2E
	je .C_Pressed
	cmp al, 0x20
	je .D_Pressed
	cmp al, 0x12
	je .E_Pressed
	cmp al, 0x21
	je .F_Pressed
	cmp al, 0x22
	je .G_Pressed
	cmp al, 0x23
	je .H_Pressed
	cmp al, 0x17
	je .I_Pressed
	cmp al, 0x24
	je .J_Pressed
	cmp al, 0x25
	je .K_Pressed
	cmp al, 0x26
	je .L_Pressed
	cmp al, 0x32
	je .M_Pressed
	cmp al, 0x31
	je .N_Pressed
	cmp al, 0x18
	je .O_Pressed
	cmp al, 0x19
	je .P_Pressed
	cmp al, 0x10
	je .Q_Pressed
	cmp al, 0x13
	je .R_Pressed
	cmp al, 0x1F
	je .S_Pressed
	cmp al, 0x14
	je .T_Pressed
	cmp al, 0x16
	je .U_Pressed
	cmp al, 0x2F
	je .V_Pressed
	cmp al, 0x11
	je .W_Pressed
	cmp al, 0x2D
	je .X_Pressed
	cmp al, 0x15
	je .Y_Pressed
	cmp al, 0x2C
	je .Z_Pressed
	cmp al, 0x39
	je .Space_Pressed
	cmp al, 0x1C
	je .Enter_Pressed
	cmp al, 0x0E
	je .delete_pls
	jmp .GetInput
.print_keyboard_Char:
    xor eax, eax
	mov eax, [DataLine]
	add eax, 78
	cmp [TypePoint], eax
	je .GetInput
    mov esi, StringKeyboard
	mov dl, [StringKeyboard]
	mov [inputChar + ecx], dl
	inc ecx
	call .print
	mov al, 0x20
	out 0x20, al
	mov byte [StringKeyboard], 0
	add dword [TypePoint], 2
	jmp .GetInput
.test:
	mov esi, test_output
	call .print
	jmp .hang
.hang:
    hlt
	jmp .hang

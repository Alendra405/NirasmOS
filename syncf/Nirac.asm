
.StartNiracMain:
    mov edi, 0xB8000
    mov ecx, 2000
    mov ax, 0x0720 
	call .clr
	jmp .StartNiracEditor
.clr:
    mov [edi], ax
    add edi, 2
    loop .clr
	ret
.StartNiracEditor:
    mov dword [DataLine], 0
	call .setLine
	mov edi, 0xB8000
	mov ecx, 80
	mov ax, 0x7020
	call .clr
	jmp .setTWords
.setTWords:
    mov dword [DataLine], 2
	call .setLine
	mov esi, NIRAC
	call .printgray
	mov dword [DataLine], 160
	call .setLine
	mov dword [TypePoint], 160

	call .setpos
	jmp .StartTypingS
.StartTypingS:
    in al, 0x64
    test al, 1
    jz .StartTypingS
	in al, 0x60
	cmp al, 0x1E
	je .A_PressedNirac
	cmp al, 0x30
	je .B_PressedNirac
	cmp al, 0x2E
	je .C_PressedNirac
	cmp al, 0x20
	je .D_PressedNirac
	cmp al, 0x12
	je .E_PressedNirac
	cmp al, 0x21
	je .F_PressedNirac
	cmp al, 0x22
	je .G_PressedNirac
	cmp al, 0x23
	je .H_PressedNirac
	cmp al, 0x17
	je .I_PressedNirac
	cmp al, 0x24
	je .J_PressedNirac
	cmp al, 0x25
	je .K_PressedNirac
	cmp al, 0x26
	je .L_PressedNirac
	cmp al, 0x32
	je .M_PressedNirac
	cmp al, 0x31
	je .N_PressedNirac
	cmp al, 0x18
	je .O_PressedNirac
	cmp al, 0x19
	je .P_PressedNirac
	cmp al, 0x10
	je .Q_PressedNirac
	cmp al, 0x13
	je .R_PressedNirac
	cmp al, 0x1F
	je .S_PressedNirac
	cmp al, 0x14
	je .T_PressedNirac
	cmp al, 0x16
	je .U_PressedNirac
	cmp al, 0x2F
	je .V_PressedNirac
	cmp al, 0x11
	je .W_PressedNirac
	cmp al, 0x2D
	je .X_PressedNirac
	cmp al, 0x15
	je .Y_PressedNirac
	cmp al, 0x2C
	je .Z_PressedNirac
	cmp al, 0x39
	je .Space_PressedNirac
	cmp al, 0x0E
	je .delete_plsNirac
	cmp al, 0x52
	je .save_pressedNiracS
	jmp .StartTypingS
	
	

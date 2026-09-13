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
.hang:
    hlt
	jmp .hang

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
.setOutPut:
    mov [eaxf], eax
	mov [edif], edx
	mov [dif], cl
	xor cl, cl
    mov eax, inputChar
    mov edx, ver
	jmp .CheckVer
.CheckVer:
    mov cl, [eax]
    cmp cl, [edx]
    jne .CheckDS

    cmp cl, 0
    je .setver

    inc eax
    inc edx
    jmp .CheckVer
.reco:
    mov eax, [eaxf]
	mov edx, [edif]
	mov [dif], cl
	xor cl, cl

	ret
.CheckDS:
    xor edx, edx
	mov edx, botm
	jmp .CheckD
.CheckD:
    mov cl, [eax]
    cmp cl, [edx]
    jne .Checkcrtrs

    cmp cl, 0
    je .setbotm

    inc eax
    inc edx
    jmp .CheckD
.Checkcrtrs:
    xor edx, edx
	mov edx, crtr
	jmp .Checkcrtr
.Checkcrtr:
    mov cl, [eax]
	cmp cl, [edx]
	jne .checkNiracS
	
	cmp cl, 0
	je .setcrtr
	
	inc eax
	inc edx
	jmp .Checkcrtr
.endcheckcom:
    call .reco
	mov esi, invalidin
	call .printred
    ret
.setcrtr:
    call .reco
	mov esi, crtro
	call .print
	ret
.setbotm:
    call .reco
	mov esi, botmo
	call .print
	ret
.setver:
    call .reco
    mov esi, vero
	call .print
	ret
.checkNiracS:
    xor edx, edx
	mov edx, nirac
	jmp .CheckNirac
.CheckNirac:
    mov cl, [eax]
	cmp cl, [edx]
	jne .endcheckcom
	
	cmp cl, 0
	je .StartNiracMain
	
	inc eax
	inc edx
	jmp .CheckNirac
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

	jmp .StartTypingS
.StartTypingS:
    in al, 0x64
    test al, 1
    jz .StartTypingS
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
	cmp al, 0x0E
	je .delete_pls
	jmp .StartTypingS
	
	

inputChar times 32 db 0
OutPutS db "O:", 0
DataLine dd 0
TypePoint dd 338
deleteChar db 0
TypePointL db 0x00
TypePointH db 0x00
WelcomeMessage db "Nirasm B&K 32bit was runned, ver 06.08.02, k0x7E00 b0x7C00", 0
getInputPrompt db "Nirasm/i>", 0
StringKeyboard db " ", 0
clrline dd 0
empty db " ", 0
OutPut db "e", 0
ver db "ver", 0
botm db "botm", 0
crtr db "crtr", 0
botmo db "hrddsk ", 0x04, 0
nirac db "nirac", 0
NIRAC db "NIRAC                    save=insert      cancell=home", 0
vero db "06.08.02  2026 ", 0x04,0
crtro db "Arman8086, iran ", 0x04, 0
invalidin db "error! invalid input", 0
eaxf dd 0
edif dd 0
dif db 0
ClearScreenStack dw 0
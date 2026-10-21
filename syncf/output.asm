
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

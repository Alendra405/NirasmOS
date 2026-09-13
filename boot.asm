org 0x7C00
bits 16
start:
    cli ;disable all ints
	
	;clear registers
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7C00 ;set Stack Offset to bootload location
	
	;Enable A20
	in al, 0x92
	or al, 00000010b
	out 0x92, al
	;end

	

	
	mov ah, 0x02
	mov al, 0x06
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov dl, 0x80
	mov bx, 0x7E00
	int 0x13
	
		
	lgdt [gdt_descriptor]
	
	mov eax, cr0
	or eax, 1
	mov cr0, eax
	
	jmp 0x08:protected_mode
	
;========================
; 32-Bit Abad
;========================

[BITS 32]
protected_mode:
    
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	
	mov esp, 0x90000
	
	;jmp 0x7E00
	jmp 0x7E00
;========================
; GDT Abad
;========================

[BITS 16]

gdt_descriptor:
    dw gdt_end-gdt_start-1
	dd gdt_start
gdt_start:
    dq 0
	dq 0x00CF9A000000FFFF
	dq 0x00CF92000000FFFF
gdt_end:

times 510-($-$$) db 0
dw 0xAA55

	
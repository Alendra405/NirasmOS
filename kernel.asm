org 7E00h
bits 16 
start:
  mov ah, 06
  mov al, 00
  mov bh, 07
  mov ch, 00
  mov cl, 00
  mov dh, 24
  mov dl, 79
  int 10h
  mov si, kernel_msg
.print_loop:
  lodsb
  or al, al
  jz .cis
  mov ah, 0x0E
  int 0x10
  jmp .print_loop
.cis: 
  mov al, [dataline]
  mov ah, 01
  add al, ah
  mov [dataline],al
  mov ah, 02
  mov bh, 00
  mov dh, [dataline]
  mov dl, 0
  int 10h
  jz .ci
  mov ah, 02
  mov bh, 00
  mov dh, [dataline]
  mov dl, 0
  int 10h
  mov si, command_input
.ci:
  lodsb
  or al, al
  mov ah, 0x0E
  int 0x10
  jmp .command_print_loop
.command_print_loop:
  lodsb
  or al, al
  jz .input_ci
  mov ah, 0x0E
  int 0x10
  jmp .command_print_loop
.input_ci:
  mov ah, 02
  mov dl,07
  int 21h
  mov ah, 01
  int 16h
  jz .input_ci
  mov ah, 0
  int 16h
  mov [input_char], al
  mov si, 0
  mov si, input_char
  jmp .print_input
.print_input:
  lodsb
  or al, al
  mov ah, 0x0E
  int 0x10
  jmp .input_ci
input_char db "" 
dataline db 00 ;default input dataline
kernel_msg db "CoreShell B&K 16bit was runned, ver 06.06.30", 0
command_input db "CoreShell>:", 0
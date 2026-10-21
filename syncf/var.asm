

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
botmo db "UNKNOWN! ", 0x04, 0
hrddskhx db "0x80 ", 0x04, 0
nirac db "nirac", 0
NIRAC db "NIRAC-EDITOR               save=insert     cancell=home", 0
vero db "06.08.02  2026 ", 0x04,0
crtro db "Arman8086, iran ", 0x04, 0
invalidin db "error! invalid input", 0
eaxf dd 0
edif dd 0
dif db 0
ClearScreenStack dw 0
DataLineBuffer dd 0
inputNirac times 512 db 0
stand db 0
sectorgeter db "SAVE TO X SECTOR = ", 0
test_output db "LINE SR0.", 0
bot db 0

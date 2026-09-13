
cd..
cd..
cd..
cd..
cd..
cd..
cd..
cd..
cd..
D:
cd programs
cd NASM
nasm -f bin D:\personals\Nirasm\boot.asm -o D:\personals\Nirasm\boot.bin

nasm -f bin D:\personals\Nirasm\kernel.asm -o D:\personals\Nirasm\kernel.bin


copy /b D:\personals\Nirasm\boot.bin+D:\personals\Nirasm\kernel.bin D:\personals\Nirasm\Nirasm.iso
cd..
cd qemu
qemu-system-x86_64 -hda D:\personals\Nirasm\Nirasm.iso
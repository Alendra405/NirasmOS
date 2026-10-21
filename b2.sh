nasm -f bin boot.asm -o boot.bin
echo bootloader converted to binary
nasm -f bin kernel.asm -o kernel.bin
echo kernel converted to binary

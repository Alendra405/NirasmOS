schmod +x syncf/connector.sh
bash syncf/connector.sh
rm kernel.asm
cp syncf/kernel2.asm kernel.asm
echo builded!
chmod +x b2.sh
bash b2.sh
rm kernel.bin
rm boot.bin
mv *kernel.bin* kernel.bin
mv *boot.bin* boot.bin
cat boot.bin kernel.bin > Nirasm.iso
qemu-system-x86_64 -hda Nirasm.iso

cd .
#!/bin/bash

objdump -S -D -l -g --disassembler-options=intel -M --x86-64 ./build/debug-linux-x86_64_-_obj/client/cl_main.o > ./asm/debug/client/cl_main.asm
objdump -S -D -l -g --disassembler-options=intel -M --x86-64 ./build/debug-linux-x86_64_-_obj/ded/sv_main.o > ./asm/debug/ded/sv_main.asm

objdump -S -D -l -g --disassembler-options=intel -M --x86-64 ./build/release-linux-x86_64_-_obj/client/cl_main.o > ./asm/release/client/cl_main.asm
objdump -S -D -l -g --disassembler-options=intel -M --x86-64 ./build/release-linux-x86_64_-_obj/ded/sv_main.o > ./asm/release/ded/sv_main.asm

read -p "Press any key to continue." x     

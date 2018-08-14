ASM = nasm
OUT = 8086ac.img

all:
	$(ASM) -i src/ src/main.s -o $(OUT)

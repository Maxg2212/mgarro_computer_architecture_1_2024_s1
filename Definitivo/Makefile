# Objetivo predeterminado
all: clean_input clean_output compile run compilesr runsr python_run

# Regla para limpiar input.bin si existe y ejecutar conversor_wav_to_bin.py
clean_input:
	@if [ -e input.bin ]; then rm input.bin; fi
	@python3 conversor_wav_to_bin.py

# Regla para limpiar output.bin y outputSR.bin si existen
clean_output:
	@rm -f output.bin outputSR.bin
	@touch output.bin outputSR.bin

# Regla para compilar y ejecutar
compile:
	@arm-linux-gnueabi-as main.s -o main.o && arm-linux-gnueabi-ld main.o -o main && rm -f main.txt && arm-linux-gnueabi-objdump -d main &> main.txt

# Regla para ejecutar con qemu-arm
run: 
	@qemu-arm main

# Regla para compilar y ejecutar
compilesr:
	@arm-linux-gnueabi-as mainSR.s -o mainSR.o && arm-linux-gnueabi-ld mainSR.o -o mainSR && rm -f mainSR.txt && arm-linux-gnueabi-objdump -d mainSR &> mainSR.txt

# Regla para ejecutar con qemu-arm
runsr:
	@qemu-arm mainSR

# Regla para ejecutar python3 interfaz.py
python_run:
	@python3 interfaz.py



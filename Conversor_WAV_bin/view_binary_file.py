def read_raw_bytes(file_path):
    try:
        with open(file_path, 'rb') as f:
            # Leer el contenido binario del archivo
            binary_data = f.read()

            # Verificar si la longitud del archivo es divisible por 4 (tamaño de una palabra de 32 bits)
            if len(binary_data) % 4 != 0:
                print("La longitud del archivo no es un múltiplo de 4. No se pueden leer palabras de 32 bits.")
                return
            
            # Iterar sobre el contenido binario, leyendo cada palabra de 32 bits
            for i in range(0, len(binary_data), 4):
                # Incrementar el contador de palabra
                palabra_num = i // 4 + 1
                # Extraer una palabra de 32 bits
                word = binary_data[i:i+4]
                # Mostrar los bytes de la palabra sin modificar
                print(f"Palabra {palabra_num}: {' '.join(f'{byte:02X}' for byte in word)}")
            
    except FileNotFoundError:
        print("El archivo no se encontró.")
    except Exception as e:
        print("Error al leer el archivo:", e)

# Ejemplo de uso
file_path = 'audio_muestras_q15_16.bin'
read_raw_bytes(file_path)

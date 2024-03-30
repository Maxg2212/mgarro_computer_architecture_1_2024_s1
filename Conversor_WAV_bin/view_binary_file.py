def read_raw_bytes(file_path, num_words):
    try:
        with open(file_path, 'rb') as f:
            # Leer el contenido binario del archivo
            binary_data = f.read()

            # Verificar si hay suficientes bytes para mostrar las primeras 'num_words' palabras
            if len(binary_data) < num_words * 4:
                print(f"El archivo no tiene suficientes datos para mostrar {num_words} palabras.")
                return
            
            # Mostrar los bytes de las primeras 'num_words' palabras en formato hexadecimal
            print(f"Primeras {num_words} palabras del archivo en formato hexadecimal:")
            for i in range(num_words):
                word_bytes = binary_data[i * 4 : (i + 1) * 4]
                print(f"Palabra {i+1}: {' '.join(f'{byte:02X}' for byte in word_bytes)}")

    except FileNotFoundError:
        print("El archivo no se encontró.")
    except Exception as e:
        print("Error al leer el archivo:", e)

# Ejemplo de uso para mostrar las primeras dos palabras del archivo
file_path = 'output.bin'
num_words_to_show = 2
read_raw_bytes(file_path, num_words_to_show)

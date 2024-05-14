def read_raw_bytes(file_path):
    try:
        with open(file_path, 'rb') as f:
            # Leer el contenido binario del archivo
            binary_data = f.read()

            # Calcular la cantidad total de palabras
            num_words = len(binary_data) // 4

            # Mostrar los bytes de todas las palabras en formato hexadecimal
            print("Palabras del archivo en formato hexadecimal:")
            for i in range(num_words):
                word_bytes = binary_data[i * 4 : (i + 1) * 4]
                print(f"Palabra {i+1}: {' '.join(f'{byte:02X}' for byte in word_bytes)}")

            # Imprimir la cantidad total de palabras
            print(f"Cantidad total de palabras en el archivo: {num_words}")

    except FileNotFoundError:
        print("El archivo no se encontró.")
    except Exception as e:
        print("Error al leer el archivo:", e)

# Ejemplo de uso para mostrar todas las palabras del archivo
file_path = 'output.bin'
read_raw_bytes(file_path)

def read_raw_bytes(file_path):
    try:
        with open(file_path, 'rb') as f:
            # Leer el contenido binario del archivo
            binary_data = f.read()

            # Encontrar la posición del último byte que no es cero
            last_non_zero_byte_index = len(binary_data) - 1
            while last_non_zero_byte_index >= 0 and binary_data[last_non_zero_byte_index] == 0:
                last_non_zero_byte_index -= 1
            
            # Calcular la cantidad total de palabras hasta el último byte no cero
            num_words = (last_non_zero_byte_index + 1) // 4

            # Mostrar los bytes de todas las palabras hasta el último byte no cero en formato hexadecimal
            print(f"Cantidad total de palabras hasta el último byte no cero del archivo: {num_words}")
            print("Palabras del archivo en formato hexadecimal:")
            for i in range(num_words):
                word_bytes = binary_data[i * 4 : (i + 1) * 4]
                print(f"Palabra {i+1}: {' '.join(f'{byte:02X}' for byte in word_bytes)}")

    except FileNotFoundError:
        print("El archivo no se encontró.")
    except Exception as e:
        print("Error al leer el archivo:", e)

# Ejemplo de uso para mostrar hasta la última palabra que no contiene ceros
file_path = 'output.bin'
read_raw_bytes(file_path)

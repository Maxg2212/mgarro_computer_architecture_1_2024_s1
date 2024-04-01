def bin_to_txt(input_file, output_file):
    try:
        with open(input_file, 'rb') as f_in:
            # Lee el contenido binario del archivo
            binary_data = f_in.read()
            
            with open(output_file, 'wb') as f_out:
                # Escribe los datos binarios en el archivo de salida
                f_out.write(binary_data)
        print("¡Archivo convertido con éxito!")
    except FileNotFoundError:
        print("El archivo de entrada no se encontró.")
    except Exception as e:
        print("Error durante la conversión:", e)
# Ejemplo de uso
input_file = 'input.bin'
output_file = 'archivo.txt'
bin_to_txt(input_file, output_file)

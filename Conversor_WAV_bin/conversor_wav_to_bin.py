def decimal_a_q16_17(numero_decimal):
    # Convertir a Q16.17
    # Q16.17 tiene 1 bit para el signo, 16 bits para la parte entera y 17 bits para la parte fraccionaria
    signo = '0' if numero_decimal >= 0 else '1'
    numero_absoluto = abs(numero_decimal)
    parte_entera = int(numero_absoluto)
    parte_fraccionaria = numero_absoluto - parte_entera

    parte_entera_binaria = bin(parte_entera)[2:].zfill(16)
    parte_fraccionaria_binaria = ""
    for _ in range(17):
        parte_fraccionaria *= 2
        bit = int(parte_fraccionaria)
        parte_fraccionaria_binaria += str(bit)
        parte_fraccionaria -= bit

    return signo + parte_entera_binaria + '.' + parte_fraccionaria_binaria

def convertir_archivo_entrada_a_q16_17(archivo_entrada, archivo_salida):
    # Leer datos del archivo de entrada y convertirlos a Q16.17
    with open(archivo_entrada, 'r') as f:
        datos_entrada = f.readlines()

    datos_q16_17 = [decimal_a_q16_17(float(dato.strip())) for dato in datos_entrada]

    # Escribir los datos convertidos en formato Q16.17 en un nuevo archivo
    with open(archivo_salida, 'w') as f:
        for dato_q16_17 in datos_q16_17:
            f.write(dato_q16_17 + '\n')

# Nombre del archivo de entrada y de salida
archivo_entrada = 'datos_entrada.txt'
archivo_salida = 'datos_salida.txt'

# Convertir el archivo de entrada a formato Q16.17 y escribir el resultado en el archivo de salida
convertir_archivo_entrada_a_q16_17(archivo_entrada, archivo_salida)






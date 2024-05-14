def decimal_a_binario(numero_decimal, bits_enteros, bits_fraccionarios):
    # Parte entera
    entero_absoluto = abs(numero_decimal)
    entero_binario = bin(int(entero_absoluto))[2:]  # Convertir a binario y eliminar el prefijo '0b'
    entero_binario = entero_binario.zfill(bits_enteros)  # Rellenar con ceros a la izquierda

    # Parte fraccionaria
    parte_fraccionaria = entero_absoluto - int(entero_absoluto)
    fraccion_binaria = ""
    for _ in range(bits_fraccionarios):
        parte_fraccionaria *= 2
        bit = int(parte_fraccionaria)
        fraccion_binaria += str(bit)
        parte_fraccionaria -= bit

    # Concatenar parte entera y parte fraccionaria
    numero_binario = entero_binario + "." + fraccion_binaria

    return numero_binario

def complemento_a_uno(numero_binario):
    complemento = ""
    for bit in numero_binario:
        if bit == '.':
            complemento += '.'
        else:
            complemento += '1' if bit == '0' else '0'
    
    return complemento

def sumar_uno(numero_binario):
    resultado = ""
    acarreo = 1
    for i in range(len(numero_binario) - 1, -1, -1):
        if numero_binario[i] == '.':
            resultado = '.' + resultado
        else:
            suma = int(numero_binario[i]) + acarreo
            resultado = str(suma % 2) + resultado
            acarreo = suma // 2
    
    return resultado

def convertir_a_negativo(numero_decimal, bits_enteros, bits_fraccionarios):
    binario = decimal_a_binario(numero_decimal, bits_enteros, bits_fraccionarios)
    complemento = complemento_a_uno(binario)
    resultado = sumar_uno(complemento)
    
    return resultado

# Ejemplo de uso
numero_decimal = -1.5
bits_enteros = 16
bits_fraccionarios = 17

resultado = convertir_a_negativo(numero_decimal, bits_enteros, bits_fraccionarios)
print("Representación en complemento a uno:", resultado)
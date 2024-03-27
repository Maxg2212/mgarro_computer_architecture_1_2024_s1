import wave
import struct
import bitstring

def complemento_a_uno(numero_binario):
    complemento = ""
    for bit in numero_binario:
        if bit == '.':
            complemento += ''
        else:
            complemento += '1' if bit == '0' else '0'
    
    return complemento

def sumar_uno(numero_binario):
    resultado = ""
    acarreo = 1
    for i in range(len(numero_binario) - 1, -1, -1):
        if numero_binario[i] == '.':
            resultado = '' + resultado
        else:
            suma = int(numero_binario[i]) + acarreo
            resultado = str(suma % 2) + resultado
            acarreo = suma // 2
    
    return resultado

def float_to_q15_16(value):
    # Convierte un número de punto flotante en formato Q15.16
    if value >= 0:
        sign = '0'
    else:
        sign = '1'
        value = abs(value)
    integer_part = int(value)
    fractional_part = int((value - integer_part) * (2**16)) # Aquí cambiamos a 2**16 para Q15.16
    q15_16 = format(integer_part, '015b') + format(fractional_part, '016b') # Cambiamos a 016b para Q15.16
    
    if sign == '1':
        binario_complemento = complemento_a_uno(q15_16)
        q15_16 = sumar_uno(binario_complemento)

    return sign + q15_16

def convertir_wav_a_bin_y_txt(archivo_wav, archivo_bin, archivo_txt_norm, archivo_txt_q15_16):
    # Abrir el archivo WAV
    with wave.open(archivo_wav, 'rb') as wav_file:
        # Obtener los parámetros del archivo WAV
        num_frames = wav_file.getnframes()
        num_channels = wav_file.getnchannels()
        sample_width = wav_file.getsampwidth()
        frame_rate = wav_file.getframerate()

        # Leer todas las muestras de audio
        frames = wav_file.readframes(num_frames)

        # Normalizar las muestras de audio
        max_valor = 2 ** (8 * sample_width - 1) - 1
        muestras_normalizadas = [int.from_bytes(frames[i:i+sample_width], byteorder='little', signed=True) / max_valor for i in range(0, len(frames), sample_width)]

        # Convertir las muestras normalizadas a formato Q15.16 en binario
        muestras_q15_16_binario = [float_to_q15_16(sample) for sample in muestras_normalizadas]

        # Escribir las muestras de audio normalizadas en un archivo de texto
        with open(archivo_txt_norm, 'w') as txt_norm_file:
            for sample in muestras_normalizadas:
                txt_norm_file.write(f"{sample}\n")
        
        # Escribir las muestras de audio en formato Q15.16 en un archivo de texto
        with open(archivo_txt_q15_16, 'w') as txt_q15_16_file:
            for sample in muestras_q15_16_binario:
                txt_q15_16_file.write(f"{sample}\n")

        # Escribir las muestras de audio en formato Q15.16 en un archivo binario
        with open(archivo_bin, 'wb') as bin_file:
            for sample_binario in muestras_q15_16_binario:
                # Convertir el número binario a su representación entera de 32 bits y escribirlo en el archivo binario
                valor_entero = bitstring.Bits(bin=sample_binario).intle
                # Asegurar que el valor entero esté dentro del rango permitido para un entero de 32 bits con signo
                valor_entero_clamped = max(-2147483648, min(valor_entero, 2147483647))
                # Convertir el valor entero a formato hexadecimal
                valor_hexadecimal = struct.pack('<i', valor_entero_clamped).hex()
                bin_file.write(bytes.fromhex(valor_hexadecimal))

        print("Archivos generados correctamente.")

# Rutas de los archivos de entrada y salida
archivo_wav = "audiowav.wav"
archivo_bin = "audio_muestras_q15_16.bin"
archivo_txt_norm = "audio_muestras_normalizadas.txt"
archivo_txt_q15_16 = "audio_muestras_q15_16.txt"

# Convertir el archivo WAV a un archivo binario en formato Q15.16 y generar los archivos de texto
convertir_wav_a_bin_y_txt(archivo_wav, archivo_bin, archivo_txt_norm, archivo_txt_q15_16)

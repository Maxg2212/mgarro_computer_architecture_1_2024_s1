
"""
def convertir_wav_a_txt(archivo_wav, archivo_txt):
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

        # Aplicar la condición a las muestras normalizadas
        muestras_final = []
        for sample in muestras_normalizadas:
            if sample > 1:
                muestras_final.append(1)
            elif sample < -1:
                muestras_final.append(-1)
            else:
                muestras_final.append(sample)

        # Escribir las muestras de audio normalizadas en un archivo de texto
        with open(archivo_txt, 'w') as txt_file:
            # Escribir la información de los parámetros
            txt_file.write(f"Numero de frames: {num_frames}\n")
            txt_file.write(f"Numero de canales: {num_channels}\n")
            txt_file.write(f"Ancho de muestra: {sample_width}\n")
            txt_file.write(f"Velocidad de cuadro: {frame_rate}\n")

            # Escribir las muestras de audio normalizadas
            for sample in muestras_final:
                txt_file.write(f"{sample}\n")

        print("Archivo de texto generado correctamente.")

# Rutas de los archivos de entrada y salida
archivo_wav = "audiowav.wav"
archivo_txt = "audio_muestras.txt"

# Convertir el archivo WAV a texto
convertir_wav_a_txt(archivo_wav, archivo_txt)

"""
"""
import wave

def convertir_wav_a_txt(archivo_wav, archivo_txt):
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

        # Escribir las muestras de audio normalizadas en un archivo de texto
        with open(archivo_txt, 'w') as txt_file:
            # Escribir la información de los parámetros
            txt_file.write(f"Numero de frames: {num_frames}\n")
            txt_file.write(f"Numero de canales: {num_channels}\n")
            txt_file.write(f"Ancho de muestra: {sample_width}\n")
            txt_file.write(f"Velocidad de cuadro: {frame_rate}\n")

            # Escribir las muestras de audio normalizadas
            for sample in muestras_normalizadas:
                txt_file.write(f"{sample}\n")

        print("Archivo de texto generado correctamente.")

# Rutas de los archivos de entrada y salida
archivo_wav = "audiowav.wav"
archivo_txt = "audio_muestras2.txt"

# Convertir el archivo WAV a texto
convertir_wav_a_txt(archivo_wav, archivo_txt)

"""
import wave
import struct

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
    fractional_part = int((value - integer_part) * (2**17))
    q15_16 = format(integer_part, '014b') + format(fractional_part, '017b')
    
    if sign == '1':
        binario_complemento = complemento_a_uno(q15_16)
        q15_16 = sumar_uno(binario_complemento)

    return sign + q15_16

def convertir_wav_a_txt(archivo_wav, archivo_txt):
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

        # Escribir las muestras de audio en formato Q15.16 en un archivo de texto
        with open(archivo_txt, 'w') as txt_file:
            # Escribir la información de los parámetros
            txt_file.write(f"Numero de frames: {num_frames}\n")
            txt_file.write(f"Numero de canales: {num_channels}\n")
            txt_file.write(f"Ancho de muestra: {sample_width}\n")
            txt_file.write(f"Velocidad de cuadro: {frame_rate}\n")

            # Escribir las muestras de audio en formato Q15.16
            for sample_binario in muestras_q15_16_binario:
                txt_file.write(f"{sample_binario}\n")

        print("Archivo de texto generado correctamente.")

# Rutas de los archivos de entrada y salida
archivo_wav = "audiowav.wav"
archivo_txt = "audio_muestras_q15_16.txt"

# Convertir el archivo WAV a texto en formato Q15.16
convertir_wav_a_txt(archivo_wav, archivo_txt)






























"""
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
"""





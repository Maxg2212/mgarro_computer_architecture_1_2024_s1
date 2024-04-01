import wave
import struct

def q15_16_to_float(value):
    # Convierte un número en formato Q15.16 a punto flotante
    sign = -1 if value & 0x8000 else 1
    value &= 0x7FFF
    return sign * (value / 32768.0)

def convertir_bin_a_wav(archivo_bin, archivo_wav, num_channels=6, sample_width=2, frame_rate=29988):
    # Leer el archivo binario
    with open(archivo_bin, 'rb') as bin_file:
        # Leer todos los bytes del archivo binario
        data = bin_file.read()

        # Convertir los bytes en una lista de enteros de 16 bits
        samples = struct.unpack(f'<{len(data)//2}h', data)

        # Abrir el archivo WAV para escribir
        with wave.open(archivo_wav, 'wb') as wav_file:
            # Establecer los parámetros del archivo WAV
            wav_file.setnchannels(num_channels)
            wav_file.setsampwidth(sample_width)
            wav_file.setframerate(frame_rate)
            wav_file.setnframes(len(samples) // num_channels)

            # Escribir los datos en el archivo WAV
            for sample in samples:
                wav_file.writeframesraw(struct.pack('<h', sample))

    print("Archivo WAV generado correctamente.")

# Rutas de los archivos de entrada y salida
archivo_bin = "output.bin"
archivo_wav_convertido = "audio_convertidodef.wav"

# Convertir el archivo binario a formato WAV
convertir_bin_a_wav(archivo_bin, archivo_wav_convertido)


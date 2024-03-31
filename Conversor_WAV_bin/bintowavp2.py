import wave
import struct

def q15_16_to_float(value):
    # Convierte un número en formato Q15.16 a punto flotante
    sign = -1 if value & 0x8000 else 1
    value &= 0x7FFF
    return sign * (value / 32768.0)

def convertir_bin_a_wav(archivo_bin, archivo_wav, num_frames=441655, num_channels=2, sample_width=2, frame_rate=176400):
    # Leer el archivo binario
    with open(archivo_bin, 'rb') as bin_file:
        # Leer todos los bytes del archivo binario
        data = bin_file.read()

        # Convertir los bytes en una lista de enteros de 16 bits
        samples = struct.unpack(f'<{len(data)//2}h', data)

        # Duplicar los datos para ambos canales
        stereo_samples = [sample for sample in samples for _ in range(num_channels)]

        # Abrir el archivo WAV para escribir
        with wave.open(archivo_wav, 'wb') as wav_file:
            # Establecer los parámetros del archivo WAV
            wav_file.setnchannels(num_channels)
            wav_file.setsampwidth(sample_width)
            wav_file.setframerate(frame_rate)
            wav_file.setnframes(num_frames)

            # Escribir los datos en el archivo WAV
            for sample in stereo_samples:
                wav_file.writeframesraw(struct.pack('<h', sample))

    print("Archivo WAV generado correctamente.")

# Rutas de los archivos de entrada y salida
archivo_bin = "audio_muestras_q15_16.bin"
archivo_wav_convertido = "audio_convertido.wav"

# Convertir el archivo binario a formato WAV
convertir_bin_a_wav(archivo_bin, archivo_wav_convertido)

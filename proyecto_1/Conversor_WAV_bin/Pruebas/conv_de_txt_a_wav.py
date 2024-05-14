import wave
import struct

def convertir_txt_a_wav(archivo_txt, archivo_wav, num_channels=1, sample_width=2, frame_rate=88200):
    # Leer los datos del archivo de texto
    with open(archivo_txt, 'r') as txt_file:
        # Leer cada línea del archivo de texto y convertirla en un número flotante
        muestras = [float(line.strip()) for line in txt_file]

    # Abrir el archivo WAV para escribir
    with wave.open(archivo_wav, 'wb') as wav_file:
        # Establecer los parámetros del archivo WAV
        wav_file.setnchannels(num_channels)
        wav_file.setsampwidth(sample_width)
        wav_file.setframerate(frame_rate)
        wav_file.setnframes(len(muestras) // num_channels)

        # Escribir los datos en el archivo WAV
        for muestra in muestras:
            # Convertir la muestra flotante a su representación en formato de bytes
            muestra_bytes = struct.pack('<h', int(muestra * 32767.0))
            wav_file.writeframesraw(muestra_bytes)

    print("Archivo WAV generado correctamente.")

# Rutas de los archivos de entrada y salida
archivo_txt = "audio_muestras_normalizadas.txt"
archivo_wav_convertido = "audio_convertido.wav"

# Convertir el archivo de texto a formato WAV
convertir_txt_a_wav(archivo_txt, archivo_wav_convertido)

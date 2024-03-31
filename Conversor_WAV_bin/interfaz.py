import pygame
import sys
import wave
import struct

# Inicializar Pygame
pygame.init()

# Definir colores
BLANCO = (255, 255, 255)
NEGRO = (0, 0, 0)
AZUL = (0, 0, 255)
VERDE = (0, 255, 0)

# Definir dimensiones de la ventana
ANCHO = 400
ALTO = 200

# Función para crear botones
def crear_boton(superficie, color, x, y, ancho, alto, texto, funcion):
    pygame.draw.rect(superficie, color, (x, y, ancho, alto))
    font = pygame.font.SysFont(None, 30)
    texto_renderizado = font.render(texto, True, BLANCO)
    text_rect = texto_renderizado.get_rect(center=(x + ancho/2, y + alto/2))
    superficie.blit(texto_renderizado, text_rect)
    # Devolvemos un rectángulo para detectar colisiones
    return pygame.Rect(x, y, ancho, alto)

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

def reproducir_audio(archivo_wav):
    pygame.mixer.music.load(archivo_wav)
    pygame.mixer.music.play()

# Crear la ventana
ventana = pygame.display.set_mode((ANCHO, ALTO))
pygame.display.set_caption('Reproductor de audio')

# Reloj para controlar la velocidad de actualización
reloj = pygame.time.Clock()

# Definir botones
boton_convertir_1 = crear_boton(ventana, AZUL, 50, 50, 300, 50, "Insertar reverb", lambda: convertir_y_reproducir("audio_muestras_q15_16.bin", "audio_convertido_1.wav"))
boton_convertir_2 = crear_boton(ventana, VERDE, 50, 120, 300, 50, "Eliminar reverb", lambda: convertir_y_reproducir("audio_muestras_q15_16.bin", "audio_convertido_2.wav"))

# Función para convertir y luego reproducir el archivo WAV
def convertir_y_reproducir(archivo_bin, archivo_wav):
    convertir_bin_a_wav(archivo_bin, archivo_wav)
    reproducir_audio(archivo_wav)

# Ciclo principal del juego
ejecutando = True
while ejecutando:
    for evento in pygame.event.get():
        if evento.type == pygame.QUIT:
            ejecutando = False
        elif evento.type == pygame.MOUSEBUTTONDOWN:
            if evento.button == 1:
                # Verificar si se hizo clic en alguno de los botones de convertir
                if boton_convertir_1.collidepoint(evento.pos):
                    convertir_y_reproducir("audio_muestras_q15_16.bin", "audio_convertido_1.wav")
                elif boton_convertir_2.collidepoint(evento.pos):
                    convertir_y_reproducir("audio_muestras_q15_16.bin", "audio_convertido_2.wav")

    # Actualizar pantalla
    pygame.display.flip()
    reloj.tick(60)

# Salir de Pygame
pygame.quit()
sys.exit()

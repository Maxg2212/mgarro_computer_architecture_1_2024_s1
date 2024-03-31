import pygame
import struct
import wave
import sys

# Definir colores
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

# Definir la clase Boton
class Boton:
    def __init__(self, x, y, width, height, color, text, callback):
        self.rect = pygame.Rect(x, y, width, height)
        self.color = color
        self.text = text
        self.font = pygame.font.SysFont(None, 20)
        self.callback = callback

    def draw(self, screen):
        pygame.draw.rect(screen, self.color, self.rect)
        if self.text:
            text_surface = self.font.render(self.text, True, BLACK)
            text_rect = text_surface.get_rect(center=self.rect.center)
            screen.blit(text_surface, text_rect)

    def handle_event(self, event):
        if event.type == pygame.MOUSEBUTTONDOWN:
            if self.rect.collidepoint(event.pos):
                self.callback()

# Función para convertir el archivo binario a WAV
def bin_to_wav():
    input_file = 'entrada.bin'
    output_file = 'salida.wav'
    sample_width = 2
    num_channels = 1
    framerate = 44100

    # Abre el archivo binario para lectura
    with open(input_file, 'rb') as f:
        # Lee todos los datos del archivo binario
        data = f.read()

    # Convierte los datos binarios de formato Q16.16 a formato decimal
    decimal_data = []
    for i in range(0, len(data), 4):
        q16_16 = struct.unpack('i', data[i:i+4])[0]  # Lee un entero de 32 bits en formato Q16.16
        decimal_value = q16_16 / (2**16)  # Convierte el valor a decimal
        decimal_data.append(decimal_value)

    # Abre el archivo WAV para escribir
    with wave.open(output_file, 'wb') as wav_file:
        # Configura los parámetros del archivo WAV
        wav_file.setnchannels(num_channels)
        wav_file.setsampwidth(sample_width)
        wav_file.setframerate(framerate)
        # Escribe los datos en el archivo WAV
        for value in decimal_data:
            wav_file.writeframes(struct.pack('<h', int(value * (2 ** 15))))  # Convierte el valor decimal a formato de 16 bits y escribe en el archivo WAV

    # Reproducir el archivo WAV
    pygame.mixer.init()
    pygame.mixer.music.load(output_file)
    pygame.mixer.music.play()

# Función principal
def main():
    # Inicializar pygame
    pygame.init()

    # Configurar la ventana
    WIDTH, HEIGHT = 600, 400
    screen = pygame.display.set_mode((WIDTH, HEIGHT))
    pygame.display.set_caption("Interfaz de Audio Radio XFM")

    # Crear los botones
    button1 = Boton(50, 200, 150, 50, WHITE, 'Introducir Reverb', bin_to_wav)
    button2 = Boton(300, 200, 150, 50, WHITE, 'Eliminar Reverb', lambda: print("Botón 2 presionado"))

    # Bucle principal
    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            for button in [button1, button2]:
                button.handle_event(event)

        screen.fill(BLACK)
        button1.draw(screen)
        button2.draw(screen)
        pygame.display.flip()

    pygame.quit()

if __name__ == '__main__':
    main()

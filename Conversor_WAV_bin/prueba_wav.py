import pygame
import os

# Inicializar Pygame
pygame.init()

# Configuración de la pantalla
screen_width = 400
screen_height = 300
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("Reproductor de Audio")

# Cargar el archivo de audio
audio_file =  "audio_convertido.wav"
pygame.mixer.music.load(audio_file)

# Colores
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

# Definir el botón
button_font = pygame.font.Font(None, 36)
button_text = button_font.render("Reproducir", True, WHITE)
button_rect = button_text.get_rect(center=(screen_width // 2, screen_height // 2))

# Variables para el control del bucle principal
running = True
playing = False

# Bucle principal
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        elif event.type == pygame.MOUSEBUTTONDOWN:
            if button_rect.collidepoint(event.pos):
                # Reproducir el audio cuando se presione el botón
                if not playing:
                    pygame.mixer.music.play()
                    playing = True

    # Actualizar la pantalla
    screen.fill(BLACK)
    screen.blit(button_text, button_rect)
    pygame.display.flip()

    # Esperar un poco para evitar la sobrecarga de la CPU
    pygame.time.Clock().tick(30)

# Finalizar Pygame
pygame.quit()

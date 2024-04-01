# @autor: Magno Efren
# Youtube: https://www.youtube.com/c/MagnoEfren/
# Reproductor de Musica

# Importación de las bibliotecas necesarias
from tkinter import Button, Label, Tk, filedialog, ttk, Frame, PhotoImage
import pygame
import random
import mutagen

# Inicialización de Pygame y variables globales
pygame.mixer.init()
pygame.mixer.init(frequency=44100)
cancion_actual = ''
direcion = ''

# Función para abrir archivos de música
def abrir_archivo():
    global direcion, pos, n, cancion_actual
    pos = 0
    n = 0
    direcion = filedialog.askopenfilenames(initialdir='/',
                                           title='Escoger la cancion(es)',
                                           filetype=(('wav files', '*.wav'), ('All files', '*.*')))
    n = len(direcion)
    cancion_actual = direcion[pos]

    nombre_cancion = cancion_actual.split('/')
    nombre_cancion = nombre_cancion[-1]


# Creación de una lista de valores para las barras de progreso
lista = []
for i in range(50, 200, 10):
    lista.append(i)

# Función para iniciar la reproducción de la música
def iniciar_reproduccion():
    global cancion_actual, direcion, pos, n, actualizar
    # Actualización de las barras de progreso con valores aleatorios
    for barra in [barra1, barra2, barra3, barra4, barra5, barra6, barra7, barra8, barra9, barra10,
                  barra11, barra12, barra13, barra14, barra15, barra16, barra17, barra18, barra19, barra20]:
        barra['value'] = random.choice(lista)

    # Actualización de la información de la canción actual y el tiempo transcurrido
    cancion_actual = direcion[pos]
    nombre_cancion = cancion_actual.split('/')
    nombre_cancion = nombre_cancion[-1]
    nombre['text'] = nombre_cancion

    time = pygame.mixer.music.get_pos()
    x = int(int(time) * 0.001)
    tiempo['value'] = x

    # Configuración del volumen y actualización del nivel de volumen en la interfaz
    y = float(int(volumen.get()) * 0.1)
    pygame.mixer.music.set_volume(y)
    nivel['text'] = int(y * 100)

    # Obtención de la duración total de la canción y actualización del tiempo máximo de la barra de progreso
    audio = mutagen.File(cancion_actual)
    log = audio.info.length
    minutos, segundos = divmod(log, 60)

    minutos, segundos = int(minutos), int(segundos)
    tt = minutos * 60 + segundos
    tiempo['maximum'] = tt
    texto['text'] = str(minutos) + ":" + str(segundos)
    
    # Actualización de la interfaz después de un tiempo específico para seguir mostrando el progreso de la canción
    actualizar = ventana.after(100, iniciar_reproduccion)

    # Si la canción ha terminado, maneja la reproducción de la siguiente canción
    if x == tt:
        ventana.after_cancel(actualizar)
        texto['text'] = "00:00"
        detener_efecto()
        if pos != n:
            pos = pos + 1
            ventana.after(100, iniciar_reproduccion)
            pygame.mixer.music.play()
        if pos == n:
            pos = 0

# Función para cargar y reproducir la canción seleccionada
def iniciar():
    global cancion_actual
    pygame.mixer.music.load(cancion_actual)
    pygame.mixer.music.play()
    iniciar_reproduccion()

# Función para retroceder a la canción anterior
def Reverberacion():
    print('Reverberacion')

# Función para avanzar a la siguiente canción
def SinReverberacion():
    print('SinReverberacion')

# Función para detener los efectos visuales en las barras de progreso
def detener_efecto():
    for barra in [barra1, barra2, barra3, barra4, barra5, barra6, barra7, barra8, barra9, barra10,
                  barra11, barra12, barra13, barra14, barra15, barra16, barra17, barra18, barra19, barra20]:
        barra['value'] = 50

# Función para detener la reproducción de la música
def stop():
    global actualizar
    pygame.mixer.music.stop()
    ventana.after_cancel(actualizar)
    detener_efecto()

# Función para pausar la reproducción de la música
def pausa():
    global actualizar
    pygame.mixer.music.pause()
    ventana.after_cancel(actualizar)
    detener_efecto()

# Función para continuar la reproducción de la música
def continuar():
    pygame.mixer.music.unpause()
    ventana.after(100, iniciar_reproduccion)

ventana =Tk()
ventana.title('Reproductor de Musica')
ventana.iconbitmap('icono.ico')
ventana.config(bg='black')
ventana.resizable(0,0)

estilo = ttk.Style()
estilo.theme_use('clam')
estilo.configure("Vertical.TProgressbar", foreground='green2', background='green2',troughcolor='black',
	bordercolor='black',lightcolor='green2', darkcolor='green2')

frame1 = Frame(ventana, bg='black', width=600, height=350)
frame1.grid(column=0,row=0, sticky='nsew')
frame2 = Frame(ventana, bg='black', width=600, height=50)
frame2.grid(column=0,row=1, sticky='nsew')

barra1 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") #,takefocus=True mode='determinate',
barra1.grid(column=0,row=0, padx = 1)
barra2 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra2.grid(column=1,row=0, padx = 1)
barra3 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra3.grid(column=2,row=0, padx = 1)
barra4 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra4.grid(column=3,row=0, padx = 1)
barra5 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra5.grid(column=4,row=0, padx = 1)
barra6 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra6.grid(column=5,row=0, padx = 1)
barra7 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") #,takefocus=True
barra7.grid(column=6,row=0, padx = 1)
barra8 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra8.grid(column=7,row=0, padx = 1)
barra9 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra9.grid(column=8,row=0, padx = 1)
barra10 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra10.grid(column=9,row=0, padx = 1)
barra11 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra11.grid(column=10,row=0, padx = 1)
barra12 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra12.grid(column=11,row=0, padx = 1)
barra13 = ttk.Progressbar(frame1, orient= 'vertical',length=300,  maximum=300, style="Vertical.TProgressbar")
barra13.grid(column=12,row=0, padx = 1)
barra14 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") 
barra14.grid(column=13,row=0, padx = 1)
barra15 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") 
barra15.grid(column=14,row=0, padx = 1)
barra16 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") 
barra16.grid(column=15,row=0, padx = 1)
barra17 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") 
barra17.grid(column=16,row=0, padx = 1)
barra18 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") 
barra18.grid(column=17,row=0, padx = 1)
barra19 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") 
barra19.grid(column=18,row=0, padx = 1)
barra20 = ttk.Progressbar(frame1, orient= 'vertical', length=300,  maximum=300, style="Vertical.TProgressbar") 
barra20.grid(column=19,row=0, padx = 1)

estilo1 = ttk.Style()
estilo1.theme_use('clam')
estilo1.configure("Horizontal.TProgressbar", foreground='red', background='black',troughcolor='DarkOrchid1',
																bordercolor='#970BD9',lightcolor='#970BD9', darkcolor='black')

tiempo = ttk.Progressbar(frame2, orient= 'horizontal', length = 390, mode='determinate',style="Horizontal.TProgressbar")
tiempo.grid(row=0, columnspan=8, padx=5)
texto = Label(frame2, bg='black', fg='green2', width=5)
texto.grid(row=0,column=8)

nombre = Label(frame2, bg='black', fg='red', width=55)
nombre.grid(column=0, row=1, columnspan=8, padx=5)
cantidad = Label(frame2, bg='black', fg='green2')
cantidad.grid(column=8, row=1)

imagen1  = PhotoImage(file ='carpeta.png')
imagen2  = PhotoImage(file ='play.png')
imagen3  = PhotoImage(file ='pausa.png')
imagen4 = PhotoImage(file ='repetir.png')
imagen5 = PhotoImage(file ='stop.png')
imagen6 = PhotoImage(file ='reverberacion.png')
imagen7 = PhotoImage(file ='sinreverberacion.png')

boton1 = Button(frame2, image= imagen1, command= abrir_archivo)
boton1.grid(column=0, row=2, pady=10)
boton2 = Button(frame2, image= imagen2, bg='yellow', command=iniciar)
boton2.grid(column=1, row=2, pady=10)
boton3 = Button(frame2,image= imagen3, bg='red', command=stop)
boton3.grid(column=2, row=2, pady=10)
boton4 = Button(frame2,image= imagen4, bg='blue', command=pausa)
boton4.grid(column=3, row=2, pady=10)
boton5 = Button(frame2, image= imagen5, bg='green2',command=continuar)
boton5.grid(column=4, row=2, pady=10)
atras = Button(frame2, image = imagen6, bg='orange',command= Reverberacion)
atras.grid(column=5, row=2, pady=10)
adelante = Button(frame2, image = imagen7, bg='green',command= SinReverberacion)
adelante.grid(column=6, row=2, pady=10)

volumen = ttk.Scale(frame2, to = 10, from_ =0, orient='horizontal',length=90, style= 'Horizontal.TScale')
volumen.grid(column=7, row=2)

style = ttk.Style()
style.configure("Horizontal.TScale", bordercolor='green2', troughcolor='black', background= 'green2', 
	foreground='green2',lightcolor='green2',darkcolor='black')  

nivel = Label(frame2, bg='black', fg='green2', width=3)
nivel.grid(column=8,row=2)

ventana.mainloop()


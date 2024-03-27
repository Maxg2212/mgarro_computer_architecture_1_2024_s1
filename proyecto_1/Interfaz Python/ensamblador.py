

# Registros en ARM
R0 = 0 # Ya se utiliza
R1 = 0 # Ya se utiliza
R2 = 0
R3 = 0
R4 = 0
R5 = 0
R6 = 0
R7 = 0 # Ya se utiliza
R8 = 0
R9 = 0
R10 = 0
R11 = 0
R12 = 0

#Parametros de inicio
k = 20205
alpha = 0.3

# Buffers de entrada y salida
input = [0] * 441000
output = [0] * 441000

# Inicializacion de los parámetros en el input buffer
input[0] = k    # El ASM debe leer el archivo input.bin
input[1] = alpha

R6 = 2 # MOV R6, #2

def Reverberacion():
    while R5 < 441000: # CMP R5, #441000  
        R2 = 1 # MOV R0, #1

        R3 = R2 - input[1] # SUB R3, R2, [input, #4]

        R4 = R3 * input[0] # Se debe realizar multiplicacion de punto fijo´


        R5 = R4 + input[R6] # ADD R5, R4, [R1, #4]

        R8 = input[R6] - input[0] # SUB R7, [R1, R6], [R1] (se guarda el valor n - k)

        _menorque(R8)
        

        R11 = input[1] * R9 

        R6+=1 # ADD R6, R6, #1

def _menorque(R8):
    if R8 < 0:
        R9 = 0 # MOV R9, #0
    else:
        R9 = output[R7] # LDR R9, [R10, R7] 

def suma():
    return 0
    
def multiplicacion():
    return 0





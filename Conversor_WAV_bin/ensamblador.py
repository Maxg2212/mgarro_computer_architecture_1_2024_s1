

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
R12 = 0 # MOV R12, #0
def Reverberacion():
    while R6 < 441000: # CMP R6, #441000  
     #   R2 = 1 # MOV R0, #1

        R3 = 1 - input[1] # SUB R3, R2, [input, #4]

        R4 = R3 * input[R6] # Se debe realizar multiplicacion de punto fijo´ (Resultado de (1- alpha) * x(n) )

        R5 = input[R6] - input[0] # ADD R5, [R1, R6], [R1] (se guarda el valor (n - k) )

        _menorque(R5)

        R8 = input[1] * R9 

        R11 = R4 + R8

        output[R12] = R11 # STR R11, [R10, R7]

        R12+=1 # ADD R12, R12, #1
        R6+=1 # ADD R6, R6, #1

def _menorque(R5):
    if R5 < 0:
        R9 = 0 # MOV R9, #0
    else:
        R9 = output[R5] # LDR R9, [R10, R7] 
    
def suma():
    return 0
    
def multiplicacion():
    return 0





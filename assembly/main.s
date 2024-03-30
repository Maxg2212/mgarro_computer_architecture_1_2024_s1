.global _start


.section .data
  constante_1: .word 0x10000 @ Valor de 1 en formato q16.17
  constante_alpha: .word 0xFFFF6666 @ Valor de alpha = 0.6 en formato Q16.17
  constante_k: .word 20205 @ Resultado de realizar K = Fs x 50ms = 20205
  mascara: .word 0xFFFF
  name_input: .asciz "input.bin"
  name_output: .asciz "output.bin"  
  buffer_input: .space 1000000    @ reserved buffer
  buffer_output: .space 1000000   @ reserved buffer

.section .text
_start:
  @ Open the file
  mov r7, #0x5            
  ldr r0, =name_input     
  mov r1, #2              
  mov r2, #0              
  swi 0                   
  @ R1 = buffer, R2 = buffer size, R3 = constant1, R4 = alpha, R5 = constantk, R6 - R9 values of the constants, R7 = swi, R10 - R12 not used


  @ Read the file with buffer
  mov r7, #0x3            
  ldr r1, =buffer_input   
  ldr r2, =#882298       @ buffer size
  swi 0   

  @ldr r1, =buffer_input
  ldr r2, =buffer_output

  @ Load the first 32-bit number into r8 ( x(1) )
  
  
  @ Load the addresses of the different constants
  ldr r3, =constante_1
  ldr r4, =constante_alpha
  ldr r5, =constante_k

  @ Load the values of the constants
  ldr r6, [r3] @ 1 Q16.17
  ldr r8, [r4] @ alpha q16.17
  ldr r9, [r5] @ constant k

  mov r3, #0 @ main counter for loop

_reverb:

  ldr r8, [r1]            @ load first 32 bits into r8 x(n)

  @(1 - a)x(n)
  add r10, r6, r8  @ 1 - 0.6 result  
  mul r11, r10, r1 @ (1 - 0.6) * x(n) (se debe cambiar como se realiza la multiplicacion)

  sub r10, r3, r9 @ (n - k)

  cmp r10, #0        @ Compara el valor en r10 con cero
  beq _equals   @ Salta a valor_igual_cero si r10 es igual a cero
  blt _less_than    @ Salta a valor_menor si r10 es menor que cero
  bgt _greater_than    @ Salta a valor_mayor si r10 es mayor que cero

  
  _end_if_else:
  
  mul r8, r4 @ alpha * y(n-k)

  add r12, r11, r8 @ (1 - 0.6) * x(n) + alpha * y(n-k)

  str r12, [r2] @ se almacena la posicion y(n) en la lista

  add r3, r3, #1  @ Incrementar el valor de r6 en uno

  @cmp r3, #882298     @ comparar r3 con 882298 que es el tamaño completo del buffer
  @blt _reverb         @ Repetir el ciclo si el valor en r3 es menor que el valor dado
  @beq _loadfiles
_mult_pfijo:

_equals:
    ldr r4, [r2]
    b _end_if_else    @ Salto al final de la sección _reverb
_less_than:
  mov r4, #0
  b _end_if_else     @ Salto al final de la sección _reverb
_greater_than:
  mov r5, #4       @ Establecer r4 en cero si r10 es igual a cero
  mul r10, r5       @ multiplicamos el indice por 4 para poder acceder a la lista sin problemas
  ldr r4, [r2, r10]
  b _end_if_else     @ Salto al final de la sección _reverb
_loadfiles:
  @ Cargar el valor #5 en la primera posición de buffer_output
  @ldr r1, =buffer_output     @ Cargar la dirección de buffer_output en r1
  @mov r3, #5                 @ Cargar el valor #5 en r3
  @str r3, [r1]               @ Guardar el valor #5 en la primera posición de buffer_output

  @ldr r4, [r1]


   @ Load the outbit.bin file
   @mov r7, #0x5            
   @ldr r0, =name_output   
   @mov r1, #2         
   @mov r2, #100
   @swi 0          

  @ Writes the output buffer in output.bin file
   @mov r7, #0x4
   @ldr r1, =buffer_output
   @ldr r2, =#882298
   @swi 0

_end:
  @ Close input
  mov r7, #6              
  swi 0                   

  @ @ Close output
   @mov r7, #6             
   @swi 0                  

  @ Finish program
  mov r7, #0x1            
  mov r0, #0             
  swi 0

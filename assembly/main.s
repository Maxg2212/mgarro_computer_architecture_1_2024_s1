.global _start


.section .data
  constante_1_alpha: .word 0x00006666 @ Valor de 1 - alpha
  constante_alpha: .word 0x0000999a @ Valor de alpha
  constante_k: .word 20205 @ Resultado de realizar K = Fs x 50ms = 20205
  constante_mask: .word 0xFFFF @ Máscara para obtener los 16 bits menos significativos
  constante_loop: .word 882298 @ Resultado de realizar K = Fs x 50ms = 20205
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

  @ Read the file with buffer
  mov r7, #0x3            
  ldr r1, =buffer_input   
  ldr r2, =#882298       @ buffer size
  swi 0     
  
  mov r3, #0 @ main counter for loop
  ldr r0, =buffer_output @ Cargar la dirección de buffer_output 
  ldr r1, =buffer_input  @ Cargar la dirección de buffer_input 
  
  
_reverb:
  ldr r2, [r1, #4] @ Cargo el valor al que apunta la direccion r1
 
  ldr r5, =constante_1_alpha
  ldr r6, [r5] @ (1 - alpha)

  b _mult_pfijo1 @ (1 - 0.6) * x(n)

  _mult_end:
    @ Se almacena en r2 resultado (1 - 0.6) * x(n)

  ldr r5, =constante_k @ Cargar la dirección de constante_k en r5
  ldr r9, [r5] @ constant k @ Cargar el valor de constante_k en r9

  sub r10, r3, r9 @ (n - k)


  cmp r10, #0        @ Compara el valor en r10 con cero
  beq _equals   @ Salta a valor_igual_cero si r10 es igual a cero
  blt _less_than    @ Salta a valor_menor si r10 es menor que cero
  bgt _greater_than    @ Salta a valor_mayor si r10 es mayor que cero

  _end_if_else:
    @ Se almacena en r4 el valor de la lista y(n-k)

  ldr r5, =constante_alpha
  ldr r8, [r5] @ alpha q16.17
  b _mult_pfijo2 @ alpha * y(n-k)

  _mult_end2:
    @ Se almacena en r8 resultado alpha * y(n-k)

  @r10, r2 registros con valores
  add r12, r2, r9 @ (1 - 0.6) * x(n) + alpha * y(n-k)

  str r12, [r0, #4] @ se almacena la posicion y(n) en la lista

  add r3, r3, #1  @ Incrementar el valor de r6 en uno

  ldr r5, =constante_loop
  ldr r8, [r5] @ alpha q16.17

  cmp r3, r8     @ comparar r3 con 882298 que es el tamaño completo del buffer
  blt _reverb         @ Repetir el ciclo si el valor en r3 es menor que el valor dado
  beq _loadfiles

_mult_pfijo2:
  ldr r5, =constante_mask
  ldr r12, [r5] @ mask

  asr r7, r8, #16 @ Qa
  asr r5, r4, #16 @ Qb

  and r10, r8, r12 @ Qc
  and r11, r4, r12 @ Qd

  mul r12, r7, r5 @ high = a * b @ high =  a * c
  mul r6, r10, r11 @ low =  b * d @ low = b * d

  mul r8, r7, r11 @ high = a * d 
  mul r9, r10, r5 @ high = b * c
  add r5, r8, r9 @ mid 

  lsl r12, r12, #16 @ high << 16
  lsr r6, r6, #16 @ low >> 16

  add r8, r12, r6 @ high<<<16 + low>>>16
  add r9, r8, r7   @ high<<<16 + low>>>16 + mid (aun no se está utilizando buffer output)
  b _mult_end2

_mult_pfijo1:
  ldr r5, =constante_mask
  ldr r8, [r5] @ (1 - alpha)

  asr r4, r6, #16 @ Qa
  asr r7, r2, #16 @ Qb

  and r5, r6, r8 @ Qc
  and r10, r2, r8 @ Qd

  mul r11, r4, r7 @ high = a * b 
  mul r12, r5, r10 @ low =  c * d 

  mul r9, r4, r10 @ high = a * d 
  mul r2, r5, r7 @ high = b * c
  add r7, r9, r2 @ mid 

  lsl r11, r11, #16 @ high << 16
  lsr r12, r12, #16 @ low >> 16

  add r4, r11, r12 @ high<<<16 + low>>>16
  add r2, r4, r7   @ high<<<16 + low>>>16 + mid (aun no se está utilizando buffer output)
  b _mult_end

_equals:
    ldr r4, [r0]
    b _end_if_else    @ Salto al final de la sección _reverb
_less_than:
  mov r4, #0
  b _end_if_else     @ Salto al final de la sección _reverb
_greater_than:
  mov r5, #4       @ Establecer r4 en cero si r10 es igual a cero
  mul r10, r5       @ multiplicamos el indice por 4 para poder acceder a la lista sin problemas
  ldr r4, [r0, r10]
  b _end_if_else     @ Salto al final de la sección _reverb
_loadfiles:
   @ Load the outbit.bin file
   @mov r7, #0x5            
   @ldr r2, =name_output   
   @mov r1, #2         
   @mov r2, #100
   @swi 0          

  @ Writes the output buffer in output.bin file
   @mov r7, #0x4
   @ldr r3, =buffer_output
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

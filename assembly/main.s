.global _start


.section .data
  constante_1: .word 0x10000 @ Valor de 1 en formato q16.17
  constante_alpha: .word 0x999A @ Valor de alpha = 0.6 en formato Q16.17
  constante_k: .word 20205 @ Resultado de realizar K = Fs x 50ms = 20205
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
  @ R1 = buffer, R2 = buffer size, R3 - R6 sin usar, R7 = llamada al sistema, R8 - R12 sin usar
  @ Read the file with buffer
  mov r7, #0x3            
  ldr r1, =buffer_input   
  ldr r2, =#882298       @ buffer size
  swi 0   

  
  ldr r1, =buffer_input
  @ Load the first 32-bit number into r8
  ldr r8, [r1]            @ load first 32 bits into r8
  @ Load the second 32-bit number into r9
  ldr r9, [r1, #544]        @ load next 32 bits (offset by 4 bytes) into r9 
  @ Direcciones de las constantes
  @ldr r3, =constante_1
  @ldr r4, =constante_alpha
  @ldr r5, =constante_k

  @ldr r6, [r3]
  @ldr r8, [r4]
  @ldr r9, [r5]
  @ Open the file output file

   @ Cargar el valor #5 en la primera posición de buffer_output
  ldr r1, =buffer_output     @ Cargar la dirección de buffer_output en r1
  mov r3, #5                 @ Cargar el valor #5 en r3
  str r3, [r1]               @ Guardar el valor #5 en la primera posición de buffer_output

  ldr r4, [r1]

   @ Write the buffer of the output file
   mov r7, #0x5            
   ldr r0, =name_output   
   mov r1, #2         
   mov r2, #100
   swi 0          

   mov r7, #0x4
   ldr r1, =buffer_output
   ldr r2, =#882298
   swi 0

   
_end:
  @ Close input
  mov r7, #6              
  swi 0                   

  @ @ Close output
   mov r7, #6             
   swi 0                  

  @ Finish program
  mov r7, #0x1            
  mov r0, #0             
  swi 0

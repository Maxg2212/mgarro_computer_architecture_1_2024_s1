.global _start
.section .data
	constante: .word 0xfffcc000
	mascara: .word 0xFFFF
	

.section .text
_start:
	mov r8, #0x00034000 @3.25
	ldr r3, =constante
	mov r4, #0x00034000 @3.25
	mov r0, #0xFFFF
	
mult_pfijo:
  asr r7, r8, #16 @ Qa
  asr r5, r4, #16 @ Qb

  and r10, r8, r0 @ Qc
  and r11, r4, r0 @ Qd

  mul r12, r7, r5 @ high = a * b @ high =  a * c
  mul r6, r10, r11 @ low =  b * d @ low = b * d

  mul r8, r7, r11 @ high = a * d 
  mul r9, r10, r5 @ high = b * c
  add r5, r8, r9 @ mid 

  lsl r12, r12, #16 @ high << 16
  lsr r6, r6, #16 @ low >> 16

  add r8, r12, r6 @ high<<<16 + low>>>16
  add r9, r8, r7   @ high<<<16 + low>>>16 + mid (aun no se está utilizando buffer output)


	
HLT:	


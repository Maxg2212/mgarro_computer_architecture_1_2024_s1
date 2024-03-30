.global _start
.section .data
	constante: .word 0xfffcc000
	mascara: .word 0xFFFF
	

.section .text
_start:
	mov r1, #0x00034000 @3.25
	ldr r3, =constante
	ldr r2, [r3]
	mov r0, #0xFFFF @256 en hexadecimales
	
mult_pfijo:
	asr r4, r1, #16 @Qa
	asr r5, r2, #16 @Qc

	and r6, r1, r0 @Qb
	and r7, r2, r0 @Qd
	
	mul r8, r4, r5 @high=axb
	mul r9, r6, r7 @low=bxd
	
	mul r10, r4, r7 @axd
	mul r11, r6, r5 @bxc
	add r5, r10, r11 @mid
	
	lsl r8, r8, #16 @high<<<16
	lsr r9, r9, #16 @low>>>16
	
	add r10, r8, r9 @high<<<16 + low>>>16
	add r11, r10, r5 @high<<<16 + low>>>16 + mid
	
	sub sp, sp, #4
	str r11, [sp]
	
HLT:	


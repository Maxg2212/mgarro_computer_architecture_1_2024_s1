.global _start

_start:
	mov r1, #0x0380
	mov r2, #0x0180
	
mult_pfijo:
	lsr r4, r1, #16
	lsr r5, r2, #16
	
	lsl r6, r1, #16
	lsl r7, r2, #16
	
	smull r1, r8, r4, r5
	smull r2, r9, r6, r7
	smull r3, r10, r4, r7
	smull r4, r11, r6, r5
	add r5, r10, r11
	
	lsl r1, r1, #16
	lsr r9, r9, #16
	
	add r10, r1, r5
	add r11, r10, r9
	
	sub sp, sp, #4
	str r11, [sp]
	
HLT:

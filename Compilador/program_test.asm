CR r4, #0
CR r1, #1
CR r2, #1
CR r3, #8
NOP
NOP
NOP
atras:
CE r1, #32
BETO cambiarenglon
TOME r1, [r4]
SUM r4, r4, #1
NOP
NOP
NOP
TOME r2, [r4]
NOP
NOP
NOP
NOP
SUM r4, r4, #1
NOP
NOP
NOP
TOME r3, [r4]
NOP
NOP
NOP
NOP
SUM r4, r4, #1
NOP
NOP
NOP
BRIN next
cambiarenglon:
RES r1, r1, #32
SUM r2, r2, #1
NOP
NOP
NOP
NOP
BRIN atras
next:
END
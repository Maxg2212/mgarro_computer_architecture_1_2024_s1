CR r4, #0
CR r1, #0
CR r2, #0
CR r3, #8

atras:
CE r1, #31
BMQ cambiarenglon
TOME r1, [r4]
sum r4, #1
TOME r2, [r4]
sum r4, #1
TOME r3, [r4]
sum r4, #1
BRIN next
cambiarenglon:
RES r1, r1, #31
sum r2, r2, #1
BRIN atras
next:
END
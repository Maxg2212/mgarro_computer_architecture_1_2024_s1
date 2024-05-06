from enum import Enum

class Type(Enum):
    Sistema = '00'
    Datos    = '01'
    Memoria  = '10'
    Control = '11'

types_dict =	{
    Type.Sistema : ['nop'],  
    Type.Datos : ['sum', 'res', 'mul','dld', 'cr', 'ce', 'pinto'],
    Type.Memoria : ['tome', 'deme'],
    Type.Control : ['beto', 'brin', 'bmnq', 'bmq'] 
}


opcode_dict =	{
    "nop" : '0',
    
    "sum" : '000',
    "res" : '001',
    "mul" : '010', 
    "dld" : '011',
    "cr" : '100',
    "ce" : '101',
    "pinto" : '111',
    
    "ldr" : '0',
    "str" : '1',
    
    "beto" : '00',
    "brin" : '01',
    "bmnq" : '10',
    "bmq" : '11'
}

getbinary = lambda x, n: format(x, 'b').zfill(n)

regs_dict =	{
    "r0"  : '0000',
    "r1"  : '0001',
    "r2"  : '0010',
    "r3"  : '0011',
    "r4"  : '0100', 
    "r5"  : '0101',
    "r6"  : '0110', 
    "r7"  : '0111',
    "r8"  : '1000',
    "r9"  : '1001',
    "r10"  : '1010',
    "r11"  : '1011'
}


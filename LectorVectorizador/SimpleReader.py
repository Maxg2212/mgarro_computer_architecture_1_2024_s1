import SimpleLetterDB

def case_a():
    SimpleLetterDB.writeA()

def case_b():
    SimpleLetterDB.writeB()

def case_c():
    SimpleLetterDB.writeC()

def case_d():
    SimpleLetterDB.writeD()

def case_e():
    SimpleLetterDB.writeE()

def case_f():
    SimpleLetterDB.writeF()

def case_g():
    SimpleLetterDB.writeG()

def case_h():
    SimpleLetterDB.writeH()

def case_i():
    SimpleLetterDB.writeI()

def case_j():
    SimpleLetterDB.writeJ()

def case_k():
    SimpleLetterDB.writeK()

def case_l():
    SimpleLetterDB.writeL()

def case_m():
    SimpleLetterDB.writeM()

def case_n():
    SimpleLetterDB.writeN()

def case_o():
    SimpleLetterDB.writeO()

def case_p():
    SimpleLetterDB.writeP()

def case_q():
    SimpleLetterDB.writeQ()

def case_r():
    SimpleLetterDB.writeR()

def case_s():
    SimpleLetterDB.writeS()

def case_t():
    SimpleLetterDB.writeT()

def case_u():
    SimpleLetterDB.writeU()

def case_v():
    SimpleLetterDB.writeV()

def case_w():
    SimpleLetterDB.writeW()

def case_x():
    SimpleLetterDB.writeX()

def case_y():
    SimpleLetterDB.writeY()

def case_z():
    SimpleLetterDB.writeZ()

def case_default():
    print("Caracter no reconocido")

def read_txt():
    with open('prueba.txt', 'r') as file:
        for line in file:
            for char in line:
                if char == ' ':
                    SimpleLetterDB.writeSpace()
                else:
                    switch = {
                        'a': case_a,
                        'b': case_b,
                        'c': case_c,
                        'd': case_d,
                        'e': case_e,
                        'f': case_f,
                        'g': case_g,
                        'h': case_h,
                        'i': case_i,
                        'j': case_j,
                        'k': case_k,
                        'l': case_l,
                        'm': case_m,
                        'n': case_n,
                        'o': case_o,
                        'p': case_p,
                        'q': case_q,
                        'r': case_r,
                        's': case_s,
                        't': case_t,
                        'u': case_u,
                        'v': case_v,
                        'w': case_w,
                        'x': case_x,
                        'y': case_y,
                        'z': case_z,
                    }
                    case_function = switch.get(char.lower(), case_default)
                    case_function()

read_txt()
SimpleLetterDB.writeSignature()
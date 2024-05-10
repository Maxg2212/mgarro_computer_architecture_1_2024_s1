import letterDB
import turtle
def case_a(posx, posy):
    letterDB.dibujar_letra_A(posx, posy)
def case_b(posx, posy):
    letterDB.dibujar_letra_B(posx, posy)
def case_c(posx, posy):
    letterDB.dibujar_letra_C(posx, posy)
def case_d(posx, posy):
    letterDB.dibujar_letra_D(posx, posy)
def case_e(posx, posy):
    letterDB.dibujar_letra_E(posx, posy)
def case_f(posx, posy):
    letterDB.dibujar_letra_F(posx, posy)
def case_g(posx, posy):
    letterDB.dibujar_letra_G(posx, posy)
def case_h(posx, posy):
    letterDB.dibujar_letra_H(posx, posy)
def case_i(posx, posy):
    letterDB.dibujar_letra_I(posx, posy)
def case_j(posx, posy):
    letterDB.dibujar_letra_J(posx, posy)
def case_k(posx, posy):
    letterDB.dibujar_letra_K(posx, posy)
def case_l(posx, posy):
    letterDB.dibujar_letra_L(posx, posy)
def case_m(posx, posy):
    letterDB.dibujar_letra_M(posx, posy)
def case_n(posx, posy):
    letterDB.dibujar_letra_N(posx, posy)
def case_o(posx, posy):
    letterDB.dibujar_letra_O(posx, posy)
def case_p(posx, posy):
    letterDB.dibujar_letra_P(posx, posy)
def case_q(posx, posy):
    letterDB.dibujar_letra_Q(posx, posy)
def case_r(posx, posy):
    letterDB.dibujar_letra_R(posx, posy)
def case_s(posx, posy):
    letterDB.dibujar_letra_S(posx, posy)
def case_t(posx, posy):
    letterDB.dibujar_letra_T(posx, posy)
def case_u(posx, posy):
    letterDB.dibujar_letra_U(posx, posy)
def case_v(posx, posy):
    letterDB.dibujar_letra_V(posx, posy)
def case_w(posx, posy):
    letterDB.dibujar_letra_W(posx, posy)
def case_x(posx, posy):
    letterDB.dibujar_letra_X(posx, posy)
def case_y(posx, posy):
    letterDB.dibujar_letra_Y(posx, posy)
def case_z(posx, posy):
    letterDB.dibujar_letra_Z(posx, posy)
def case_default(posx, posy):
    print("No se reconoce el caracter")

def read_txt(): # Lee el archivo prueba.txt y dibuja las letras
    with open('prueba.txt', 'r') as file:

        posx = -334
        posy = 214
        lettercount = 0

        for line in file:
            for letter in line:
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
                    'z': case_z
                }
                case_function = switch.get(letter, case_default)
                if case_function:
                    # Dibujar la letra usando la función correspondiente
                    case_function(posx, posy)

                    # Actualizar la posición para la siguiente letra
                    posx += 80  # Moverse 50 unidades a la derecha para la siguiente letra
                    lettercount += 1

                    # Si se han dibujado 6 letras, moverse a la siguiente línea
                    if lettercount == 6:
                        posx = -334
                        posy -= 120  # Moverse 60 unidades hacia abajo para la siguiente línea
                        lettercount = 0
    turtle.done()


read_txt()
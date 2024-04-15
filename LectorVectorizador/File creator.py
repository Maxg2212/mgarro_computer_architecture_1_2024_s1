def create_bin_file():
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    with open('prueba.bin', 'wb') as file:
        for letter in alphabet:
            file.write(letter.encode('utf-8'))

create_bin_file()
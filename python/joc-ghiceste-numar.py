import random
import os
import json

min_val = int(os.getenv("MIN_VAL", 1))
max_val = int(os.getenv("MAX_VAL", 10))

scoruri_fisier = "scoruri.json"

# Incarca scoruri din fisier
def incarca_scoruri():
    if os.path.exists(scoruri_fisier):
        with open(scoruri_fisier, "r") as f:
            return json.load(f)
    return {}

# Salveaza scoruri in fisier
def salveaza_scoruri(scoruri):
    with open(scoruri_fisier, "w") as f:
        json.dump(scoruri, f, indent=4)

scoruri = incarca_scoruri()

nume_utilizator = input("Cum te cheama? ")

numar_generat = random.randint(min_val, max_val)


def citeste_intreg(min_arg, max_arg=100):
    while True:
        try:
            valoare_introdusa = int(input(f"Introduceti un numar de la {min_arg} la {max_arg}: "))
            if min_arg <= valoare_introdusa <= max_arg:
                return valoare_introdusa
            else:
                print(f"Numarul introdus trebuie sa fie intre {min_arg} si {max_arg}")
        except Exception as eroare:
            print(eroare)
            continue


# Joc principal
tentativa = 0
while True:
    numar_introdus = citeste_intreg(min_val, max_val)
    tentativa += 1
    if numar_introdus < numar_generat:
        print(f"Numarul introdus este mai mic decat numarul cerut. Tentativa {tentativa}")
    elif numar_introdus > numar_generat:
        print(f"Numarul introdus este mai mare decat numarul cerut. Tentativa {tentativa}")
    else:
        print(f"Ai ghicit numarul din a {tentativa}-a incercare!")
        break

# Actualizeaza scorul utilizatorului
scoruri[nume_utilizator] = tentativa

salveaza_scoruri(scoruri)

print("Scorul tau a fost salvat.")

print(f"Scorurule precedente: {scoruri}")

# Exercitiu despre functii in Python
# Rulati cu: python3 ex26-functions.py

# 1. Functie simpla fara parametri si fara return
def salut():
    print("Buna ziua!")

print("=== Functie simpla ===")
salut()

# 2. Functie cu parametri
def salut_persoana(nume):
    print(f"Buna ziua, {nume}!")

print("\n=== Functie cu parametri ===")
salut_persoana("Maria")
salut_persoana("Ion")

# 3. Functie cu return
def aduna(a, b):
    return a + b

print("\n=== Functie cu return ===")
rezultat = aduna(5, 3)
print(f"5 + 3 = {rezultat}")
print(f"10 + 20 = {aduna(10, 20)}")

# 4. Functie cu parametri default
def salut_complet(nume, titlu="Domnule"):
    return f"Buna ziua, {titlu} {nume}!"

print("\n=== Functie cu parametri default ===")
print(salut_complet("Popescu"))
print(salut_complet("Ionescu", "Doamna"))

# 5. Functie cu multiple valori de return
def calculeaza_zona_si_perimetru(lungime, latime):
    zona = lungime * latime
    perimetru = 2 * (lungime + latime)
    return zona, perimetru

print("\n=== Functie cu multiple valori de return ===")
z, p = calculeaza_zona_si_perimetru(5, 3)
print(f"Pentru un dreptunghi 5x3:")
print(f"  Zona: {z}")
print(f"  Perimetru: {p}")

# 6. Functie cu liste ca parametri
def calculeaza_medie(numere):
    if len(numere) == 0:
        return 0
    return sum(numere) / len(numere)

print("\n=== Functie cu liste ca parametri ===")
note = [10, 8, 9, 7, 10]
medie = calculeaza_medie(note)
print(f"Notele: {note}")
print(f"Media: {medie}")

# 7. Functie care apeleaza alta functie
def verifica_promovat(note):
    medie = calculeaza_medie(note)
    if medie >= 5:
        return True, medie
    return False, medie

print("\n=== Functie care apeleaza alta functie ===")
note_student1 = [8, 9, 10, 7]
promovat, medie = verifica_promovat(note_student1)
if promovat:
    print(f"Studentul este promovat cu media {medie}")
else:
    print(f"Studentul nu este promovat. Media: {medie}")

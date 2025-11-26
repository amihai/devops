# Exercitiu cu functii recursive in Python
# Functiile recursive sunt functii care se apeleaza pe ele insele (itself)
# Run with: python3 ex26-recursive-functions.py


# 1. Factorial - calculam n! = n * (n-1) * (n-2) * ... * 1
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)


# 2. Fibonacci - calculam al n-lea numar din sirul Fibonacci
# Sirul Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13, 21, ...
# Nota: Aceasta implementare are complexitate exponentiala O(2^n)
# Pentru valori mari ale lui n, se recomanda memoizare sau iteratie
def fibonacci(n):
    if n <= 0:
        return 0
    if n == 1:
        return 1
    return fibonacci(n - 1) + fibonacci(n - 2)


# 3. Suma elementelor dintr-o lista
def suma_lista(lista):
    if len(lista) == 0:
        return 0
    return lista[0] + suma_lista(lista[1:])


# 4. Numaratoare inversa (countdown)
def numaratoare_inversa(n):
    if n <= 0:
        print("Start!")
        return
    print(n)
    numaratoare_inversa(n - 1)


# 5. Putere - calculam x la puterea n (pentru n >= 0)
def putere(x, n):
    if n < 0:
        raise ValueError("Exponentul trebuie sa fie >= 0")
    if n == 0:
        return 1
    return x * putere(x, n - 1)


# Exemple de utilizare
if __name__ == "__main__":
    print("=== Functii Recursive ===\n")

    # Factorial
    print("1. Factorial:")
    for i in range(6):
        print(f"   {i}! = {factorial(i)}")

    print("\n2. Fibonacci:")
    print("   Primele 10 numere din sirul Fibonacci:")
    fib_numbers = [fibonacci(i) for i in range(10)]
    print(f"   {fib_numbers}")

    print("\n3. Suma elementelor din lista:")
    lista = [1, 2, 3, 4, 5]
    print(f"   Lista: {lista}")
    print(f"   Suma: {suma_lista(lista)}")

    print("\n4. Numaratoare inversa de la 5:")
    numaratoare_inversa(5)

    print("\n5. Putere:")
    print(f"   2^10 = {putere(2, 10)}")
    print(f"   3^4 = {putere(3, 4)}")

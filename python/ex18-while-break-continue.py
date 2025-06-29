import random

random_number = random.randint(0, 100)

attempts = 0
while True:
    attempts += 1
    user_number = int(input("What number am I thinking of? "))
    if user_number < random_number:
        print("Too small")
        continue
    elif user_number > random_number:
        print("Too big")
        continue
    else:
        print(f"Correct! You guessed in {attempts} attempts")
        break

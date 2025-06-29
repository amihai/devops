import os

age = int(input("Age?"))

if age > 0 and age < 18:
    print("Under 18")
elif age >= 18 and age < 150:
    print("You can apply for driving license")
else:
    print("Invalid age!")

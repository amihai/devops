age = input("Your age? ")
age = int(age)

if age >= 18:
    print("You can apply for driving licence!")
else:
    print(f"You cannot apply now for driving licence! Com back in {18 - age} years")

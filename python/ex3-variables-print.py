# Declare different variables types and
# print them using different printing methods

age = 23  # Integer
cost = 12.3  # Float
name = "Popescu Ioana"  # String
is_valid = True  # Boolean

print("Age is", age)
print("Age is " + str(age))
print(f"Age is {age}")

complex_message = f"""
Age is {age}
Cost is {cost} and name is {name}
Is User Valid {is_valid}
"""
print(complex_message)

print(f"This is a message with simple quotes age={age}")

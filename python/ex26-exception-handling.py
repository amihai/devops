# Exception Handling in Python
# Run with:
# python3 ex26-exception-handling.py

print("=== Python Exception Handling Examples ===\n")

# Example 1: Basic try-except
print("Example 1: Basic try-except")
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Error: Cannot divide by zero!")
print()

# Example 2: Catching multiple exceptions
print("Example 2: Catching multiple exceptions")
try:
    number = int("not_a_number")
except ValueError:
    print("Error: Invalid value for conversion!")
except TypeError:
    print("Error: Type mismatch!")
print()

# Example 3: Using else clause
print("Example 3: Using else clause (executes if no exception)")
try:
    result = 10 / 2
except ZeroDivisionError:
    print("Error: Division by zero!")
else:
    print(f"Division successful! Result: {result}")
print()

# Example 4: Using finally clause
print("Example 4: Using finally clause (always executes)")
try:
    file = open("/tmp/test_file.txt", "r")
    content = file.read()
except FileNotFoundError:
    print("Error: File not found!")
finally:
    print("Finally block: This always executes")
print()

# Example 5: Catching generic exceptions
print("Example 5: Catching any exception")
try:
    result = 10 / 0
except Exception as e:
    print(f"An error occurred: {type(e).__name__} - {e}")
print()

# Example 6: Raising exceptions
print("Example 6: Raising exceptions")
def check_age(age):
    if age < 0:
        raise ValueError("Age cannot be negative!")
    return age

try:
    check_age(-5)
except ValueError as e:
    print(f"Error: {e}")
print()

# Example 7: File handling with exception handling
print("Example 7: Safe file reading")
file_path = "/tmp/sample.txt"
try:
    with open(file_path, "r") as f:
        content = f.read()
        print(f"File content: {content}")
except FileNotFoundError:
    print(f"Error: File '{file_path}' not found!")
except PermissionError:
    print(f"Error: No permission to read '{file_path}'!")
except Exception as e:
    print(f"Unexpected error: {e}")
print()

# Example 8: User input with exception handling
print("Example 8: Safe user input handling")
try:
    user_input = input("Enter a number: ")
    number = int(user_input)
    result = 100 / number
    print(f"100 divided by {number} = {result}")
except ValueError:
    print("Error: Please enter a valid number!")
except ZeroDivisionError:
    print("Error: Cannot divide by zero!")
except KeyboardInterrupt:
    print("\nProgram interrupted by user!")
print()

print("=== Exception Handling Examples Complete ===")

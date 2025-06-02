import os

input_path = input("Insert a path: ")

if os.path.isdir(input_path):
    print(f"The path {input_path} is directory")
elif os.path.isfile(input_path):
    print(f"The path {input_path} is directory")
else:
    print(f"The path {input_path} is not a file or directory")

print("Done!")

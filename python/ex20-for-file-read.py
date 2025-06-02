import os
import sys

file_path = input("File path? ")

if not os.path.isfile(file_path):
    print("File is missing!")
    sys.exit(1)

with open(file_path, "r") as file:
    for line in file:
        print(f"Line: {line}")

print("Done reading file with FOR")

with open(file_path, "r") as f:
    line = f.readline()
    while line:
        print(f"Line: {line}")
        line = f.readline()

print("Done reading file with WHILE")

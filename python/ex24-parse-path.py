# search for a command or file in path
import os

command_to_search = input("Command to search: ")

path_content = os.environ["PATH"]
path_list = path_content.split(":")
print(f"We have {len(path_list)} paths in PATH variable")

for path in path_list:
    if command_to_search in os.listdir(path):
        print(f"{path}/{command_to_search}")

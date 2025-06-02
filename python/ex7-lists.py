users = ["Bob", "Alice", "Mike"]

print(users)
print(f"Initial list length: {len(users)}")

users.append("Mari")
print(f"List length after adding Mari: {len(users)}")

print(f"On index 2 we have: {users[2]}")
print("Update index 2")
users[2] = "Patrick"
print(f"On index 2 we have: {users[2]}")

print(f"Stergem Elementul de pe pozitia 1 din lista {users}")
del users[1]
print(f"Lista dupa stergere: {users}")

print(f"Is Patrick in users: {'Patrick' in users}")
print(f"Is Marta in users: {'Marta' in users}")

another_list_of_users = ["Marta", "Patrick", "Charlie"]
print(f"Extend list {users} with {another_list_of_users}:")
users.extend(another_list_of_users)
print(users)

users.sort()
print(f"Sorted: {users}")
users.sort(reverse=True)
print(f"Reverse Sorted: {users}")

users.clear()
print(f"List after clear: {users}")

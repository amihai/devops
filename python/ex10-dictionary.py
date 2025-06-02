user_details = {
    "name": "Eugenia Ionescu",
    "age": 23,
    "is_admin": True,
    "address": {"street": "One Infinity Loop", "number": 1},
}

print(user_details)
print(user_details["name"])
print(user_details["address"]["street"])

user_details["address"]["street"] = "Bd. Unirii"
print(user_details["address"]["street"])
del user_details["address"]["street"]

if "street" in user_details["address"]:
    print(user_details["address"]["street"])
else:
    print("No street")

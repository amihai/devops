import json

user_details = {
    "name": "Eugenia Ionescu",
    "age": 23,
    "is_admin": True,
    "address": {"street": "One Infinity Loop", "number": 1},
}

with open("/tmp/user_details.json", "w") as f:
    json.dump(user_details, f, indent=4)
    print("JSON created on disk!")

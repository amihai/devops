import json


with open("/tmp/user_details.json", "r") as f:
    user_details = json.load(f)
    print(user_details)

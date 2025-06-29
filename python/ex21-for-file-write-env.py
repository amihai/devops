import os

with open("/tmp/dump.env", "a") as file:
    for env_variable_name in os.environ:
        env_variable_value = os.environ[env_variable_name]
        print(f"{env_variable_name}={env_variable_value}")
        file.write(f"{env_variable_name}={env_variable_value}\n")

print("Done!")

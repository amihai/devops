modules = ("Linux", "Bash", "Git", "Python")

print(f"Second element from tuple: {modules[1]}")
print(f"Size of the tuple: {len(modules)}")

for module in modules:
    print(f"\f {module}")

print(f"Is git in modules: {'Git' in modules}")
import random
import logging
from datetime import datetime
import time
import sys

number_of_logs = int(sys.argv[1]) if len(sys.argv) > 1 else 100

# Sample data
users = ['alice', 'bob', 'charlie', 'dee', 'eve']
messages = [
    "Login successful",
    "File uploaded",
    "Permission denied",
    "Disk space low",
    "User logged out",
    "Error reading file",
    "Configuration updated",
    "AUTH Failed",
    "Use password=SecretPassword to login to database on host=database.com"
]
log_levels = ['INFO', 'WARNING', 'ERROR', 'DEBUG']

# Configure logging to print in file and to console
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s %(message)s',
    handlers=[logging.FileHandler("app.log"), logging.StreamHandler()]
)

def generate_log():
    user = random.choice(users)
    level = random.choice(log_levels)
    message = random.choice(messages)
    log_entry = f"user={user} message=\"{message}\""

    if level == 'INFO':
        logging.info(log_entry)
    elif level == 'WARNING':
        logging.warning(log_entry)
    elif level == 'ERROR':
        logging.error(log_entry)
    elif level == 'DEBUG':
        logging.debug(log_entry)

for _ in range(number_of_logs):
    generate_log()


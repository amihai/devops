import hashlib
import base64
import os
# from Crypto.Cipher import AES
# from Crypto.Util.Padding import pad, unpad

# pip install pycryptodome

def base64_encode(text:str) -> str:
    return base64.b64encode(text.encode()).decode()

def base64_decode(text:str) -> str:
    return base64.b64decode(text).decode()

def sha256sum(text:str):
    return hashlib.sha256(text.encode()).hexdigest()

def sha256sum_file(file_path:str):
    if os.path.isfile(file_path):
        with open(file_path, 'rb') as f:
            return hashlib.sha256(f.read()).hexdigest()
    return None
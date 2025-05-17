import hashlib

def hash_password(password):
    # folosirea algoritmului MD5 — nesigur
    return hashlib.md5(password.encode()).hexdigest()

#! /bin/bash

# Faceți un script ce compara dacă 2 fișiere (primite ca argument) sunt identice ca si continut. (sha256sum).
#
# Bonus (dificultate ridicata): În loc de 2 fișiere comparati o lista de oricât de multe fișiere. Dacă oricare 2 fișiere din lista sunt diferite intoarce-ti un mesaj de eroare. 

first_hash_code=""
for file in "$@"; do
    echo "[INFO] Check file $file"
    if [ ! -f "$file" ]; then
        echo "No $file. Skip it"
        continue
    fi
    hash_code=$(sha256sum "$file" 2> /dev/null | awk '{print $1}')
    if [ -z  "$first_hash_code" ]; then
        echo "[INFO] This is the first file"
        first_hash_code=$hash_code
    elif [ "$hash_code" != "$first_hash_code" ]; then
        echo "[ERROR] Files have different content"
        exit 1
    fi
done

echo "[INFO] All files have the same content"

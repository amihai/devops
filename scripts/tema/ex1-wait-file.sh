#! /bin/bash

# Faceți un script ce așteaptă (la nesfarsit) după un fisier pe disk sa fie creat (ce fișier doriti). După ce fișierul a fost create scriptul afișează un mesaj și iese cu succes.

# Bonus (dificultate medie): Modificați scriptul să nu aștepte la nesfarsit ci maxim 1 minut. Dar daca fisierul este create mai devreme de 1 minut scriptul trebuie sa se termine mai devreme.

file_to_wait="${1:-file.txt}"

echo "Waiting for file $file_to_wait to be created"

for index in {1..60}; do
    if [ -f "$file_to_wait" ]; then
        echo "File $file_to_wait was created"
        exit 0
    else
        sleep 1
    fi
done

echo "Timeout Error: File $file_to_wait was not created."
exit 1

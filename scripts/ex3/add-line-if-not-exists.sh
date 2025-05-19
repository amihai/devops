#! /bin/bash

# Adauga o line intr-un fisier daca nu a fost deja adaugata
# Verifica intai daca fisierul exista si avem dreptul de write pe el

FILE_PATH="$HOME/.bashrc"
NEW_LINE="alias p='python3 '"

if [ -f "$FILE_PATH" ] && [ -w "$FILE_PATH" ]; then
    echo "Fisierul $FILE_PATH exista si am dreptul sa-l editez"
else
    echo "Fisierul $FILE_PATH nu exista sau nu am dreptul sa-l editez"
    exit 1
fi

if grep "$NEW_LINE" $FILE_PATH; then
    echo "Linia $NEW_LINE deja exista in fisierul $FILE_PATH"
else
    echo $NEW_LINE >> $FILE_PATH
    echo "Linia $NEW_LINE a fost adaugata cu success la fisierul $FILE_PATH"
fi

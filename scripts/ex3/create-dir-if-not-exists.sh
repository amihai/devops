#! /bin/bash

# Create a directory if not exists
# The directory path is receive as argument

DIRECTOR=$1 
if [ -z "$DIRECTOR" ]; then
    echo "Nu a fost pasat niciun director"
    echo "Exemplu de utilizare"
    echo "$0 /cale/catre/noul/director/"
    exit 1
fi

if [ -d "$DIRECTOR" ]; then
    echo "Directorul $DIRECTOR deja exista"
else
    echo "Directorul nu exista. Creare in curs..."
    if ! mkdir -p "$DIRECTOR"; then
        echo "A aparut o eroare. Directorul nu a fost creat"
    else
        echo "Directorul $DIRECTOR a fost creat cu success."
    fi
fi

#! /bin/bash

# Numara cate fisiere sunt intr-un director pasat ca argument
# Daca nu a fost pasat ca argument niciun director se citeste numele directorului 
# din variabila de mediu cu numele CALE_DIRECTOR_DEFAULT
# Daca directorul nu a fost pasat nici ca argument si nici ca variabila de mediu afisam eroare si iesim cu cod de eroare

if [ "$#" -eq "1" ]; then
    CALE_DIRECTOR=$1
else
    CALE_DIRECTOR="$CALE_DIRECTOR_DEFAULT"
fi

if [ -z "$CALE_DIRECTOR" ]; then
    echo "CALE_DIRECTOR nu a fost setata nici ca argument si nici din variabile de mediu"
    exit 1
fi

NO_FILES=$(ls -al "$CALE_DIRECTOR" | wc -l)
echo "Sunt $NO_FILES in directorul $CALE_DIRECTOR"

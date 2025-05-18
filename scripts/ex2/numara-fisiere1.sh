#! /bin/bash


# Numara cate fisiere sunt intr-un director pasat ca argument
# Daca nu a fost pasat ca argument niciun director afiseaza un mesaj si iese cu cod de eroare
# Daca directorul nu exista se cere introducerea altui director


if [ "$#" -ne 1 ]; then
    echo "Te rog sa introduci 1 argument."
    echo Exemplu de rulare:
    echo "$0 /tmp"
    exit 1
fi

CALE_DIRECTOR=$1

# -d verifica daca un director exista
# ! inseamna negatie
if [ ! -d "$CALE_DIRECTOR" ]; then
    echo "Calea introdusa nu exista sau nu este un director: $CALE_DIRECTOR"
    read -r -p "Te rog sa introduci o cale de director valida: " CALE_DIRECTOR
fi

NO_FILES=$(ls -al "$CALE_DIRECTOR" | wc -l)
echo "Sunt $NO_FILES in directorul $CALE_DIRECTOR"
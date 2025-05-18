#! /bin/bash

# Numara cate fisiere sunt intr-un director pasat ca argument
# Daca nu am pasat niciun director afisam mesaj si iesim cu eroare
# Daca am pasat un string ce nu este un director afisam mesaj si iesim cu eroare
# Daca nu putem citi directorul afisam mesaj si iesim cu eroare 

# Intai verificam daca am pasat exact 1 argument
if [ "$#" -ne "1" ]; then 
    echo "Trebuie pasat exact un argument. Calea catre un director valid."
    echo "Exemplu:"
    echo "$0 /tmp"
    exit 1
fi

# Apoi verificam daca am pasat un director
CALE_DIRECTOR=$1
if [ ! -d "$CALE_DIRECTOR" ]; then
    echo "Nu este un director pe disk: $CALE_DIRECTOR"
    exit 2
fi

# Acum verificam daca directorul se poate lista. Nu ma intereseaza sa vad outputul sau erorile
ls -al "$CALE_DIRECTOR" &> /dev/null 
status_comanda=$?
if [ "$status_comanda" -ne "0" ]; then
    echo "Nu putem lista directorul $CALE_DIRECTOR. Probabil o problema de permisiuni."
    exit 3
fi

NO_FILES=$(ls -al "$CALE_DIRECTOR" | wc -l)
echo "Sunt $NO_FILES in directorul $CALE_DIRECTOR"



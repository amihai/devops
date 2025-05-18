#! /bin/bash

# Numara cate fisiere sunt intr-un director pasat ca argument
# NU avem voie sa numaram fisierele din directorul /etc

CALE_DIRECTOR=$1

echo "Trebuie sa numaram fisierle din calea $CALE_DIRECTOR"
echo "Intai rezolvam calea absoluta a directorului"

# Operatorul && executa a doua comanda daca prima a fost cu success
CALE_ABSOLUTA=$(cd "$CALE_DIRECTOR" && pwd)
echo "Calea absoluta introdusa este $CALE_ABSOLUTA"

if [ "/etc" = "$CALE_ABSOLUTA" ]; then
    echo "Nu avem voie sa listam $CALE_ABSOLUTA"
    exit 1
fi

NO_FILES=$(ls -al "$CALE_ABSOLUTA" | wc -l)
echo "Sunt $NO_FILES in directorul $CALE_DIRECTOR"


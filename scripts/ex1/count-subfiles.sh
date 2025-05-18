#! /bin/bash

# Numara cate fisiere sunt intr-un director pasat ca parametru
# Daca nu este pasat niciun director cauta in /tmp

# Exemple de rulari:
# ./count-subfiles.sh /etc
# ./count-subfiles.sh
# ./count-subfiles.sh ~

CALE_DIRECTOR=${1:-"/tmp"}

NO_FILES=$(ls -al $CALE_DIRECTOR | wc -l)

echo "Avem $NO_FILES in directorul $CALE_DIRECTOR"
echo "Am rulat scriptul la data $(date)"




# Cauta intr-un fisier pasat ca parametru
# Daca nu este pasat niciun fisier cauta in /tmp

# Exemple:
# ./command-subst.sh /etc
# ./command-subst.sh
# ./command-subst.sh ~

CALE_DIRECTOR=${1:-"/tmp"}

NO_FILES=$(ls -al $CALE_DIRECTOR | wc -l)

echo "Avem $NO_FILES in directorul $CALE_DIRECTOR"

echo "Am rulat scriptul la data $(date)"


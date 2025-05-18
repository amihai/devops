#! /bin/bash

# Ridica un numar la o putere

# Exemplu de rulare:
# ./ridica-la-putere.sh 12 3

NUM=$1
PUTEREA=$2

# Aici facem operatia matematica de ridicare la putere
RESULT=$(( NUM ** PUTEREA ))

echo "$NUM ridicat la putera $PUTEREA este:  $RESULT"

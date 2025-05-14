
# Ridica un numar la o putere

# Exemplu:
# ./math.sh 12 3

NUM=$1
PUTEREA=$2

RESULT=$(( NUM ** PUTEREA ))

echo "$NUM ridicat la putera $PUTERE este:  $RESULT"

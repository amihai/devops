

# chmod +x var-speciale.sh

# ./var-speciale.sh

# # ./var-speciale.sh Ana 23
# Observam valoarea default Bucuresti

# ./var-speciale.sh Ana 23 Constanta Muzica

echo "Numele scriptului curent este:" $0

echo "Si am primit $# argumente"

echo "Argumente: $@"


NAME=$1
AGE=$2
CITY=${3:-Undefined}


echo "$NAME are varsta de $AGE si este din $CITY"

echo "$NAME are varsta de $AGE si este din $CITY"

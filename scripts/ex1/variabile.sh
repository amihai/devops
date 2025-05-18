
# chmod +x variable.sh
# ./variable.sh
# Observam ca in subscript o sa vedem doar ce am definit cu export

export NUME_CURSANT="Andrei"
AGE=25

echo $NUME_CURSANT are varsta de $AGE
echo "$NUME_CURSANT are varsta de $AGE"
echo '$NUME_CURSANT are varsta de $AGE'

./subscript.sh

echo "Am revenit in variable.sh"

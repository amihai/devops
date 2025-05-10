#! /bin/bash

# chmod u+x setup.sh

# ./info.sh
# source info.sh
# . info.sh

echo "PID-ul procesului curent este: " $$

echo "Numele programului curent este: "
cat /proc/$$/status | grep Name

echo "Numele scriptului curent este $0"

echo "Numarul de argumente trimis scriptului este $#"
echo "Primul argument trimis scriptului este $1"
echo "Al doilea argument trimis scriptului este $2"

echo "Toate argumentele ca lista: $@"

echo "Statusul ultimei comenzi: $?"


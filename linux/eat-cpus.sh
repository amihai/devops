#!/bin/bash

# chmod +x burn_cpu.sh
# ./eat-cpus.sh 4   # va consuma 4 core-uri



# Verificăm dacă a fost dat un argument
if [ -z "$1" ]; then
    echo "Utilizare: $0 <numar_cpu>"
    exit 1
fi

NUM_CPUS=$1

# Funcție care face un loop infinit (consumă CPU)
burn_cpu() {
    while :; do :; done
}

# Pornim câte un proces de burn_cpu pe fiecare CPU cerut
for ((i=0; i<NUM_CPUS; i++)); do
    burn_cpu &
done

# Așteptăm ca toate procesele să ruleze (scriptul nu se termină singur)
wait


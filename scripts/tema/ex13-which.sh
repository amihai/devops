#! /bin/bash

# Faceti un script cu numele which.sh ce:
# Parseaza variabila PATH și pune într-un array toate căile.
# Itereaza cu un for pe acest array de cai și pentru fiecare cale:
# cauta dacă acea cale contine un fisier executabil cu numele primit ca argument la script (de exemplu ./which.sh ls)
# afișează toate căile ce conțin acel executabil.
# Dacă nu a găsit nicio cale ce contine acel executabil afișați în mesaj de eroare și terminati scriptul cu un cod de eroare.



if [ $# -ne 1 ]; then
	echo "Example of usage: $0 <command_to_find>"
	exit 1
fi
command_to_find=$1

found=()

# paths=$(echo $PATH | tr ':' ' ')
# for path in $paths;do

IFS=':' read -ra paths <<< "$PATH" 
for path in ${paths[@]};do
    if [ -x "$path/$command_to_find" ]; then
        found+=("$path")
    fi
done

if [ "${#found[@]}" -gt 0 ];then
    echo The $command_to_find was found in paths:
    for path in ${found[@]}; do
        echo $path
    done
else
    echo "The $command_to_find was not found"
    exit 1
fi

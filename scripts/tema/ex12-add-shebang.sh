#! /bin/bash

#Faceti un script de bash ce adauga linia de shebang la toate scripturile (bash) ce nu au deja dintr-un director primit ca parametru.

DIR_PATH=$1

if [ "$#" -ne 1 ]; then
	echo "[ERROR] Nu a fost pasata calea catre director."
	echo "Exemplu utilizare script $0 /tmp/"
	exit 1
fi

if [ -f "$DIR_PATH" ]; then
    echo "[ERROR] Ai introdus un fisier"
    exit 1
fi

for FILE in "$DIR_PATH"/*.sh; do
	if [ -f "$FILE" ]; then
        chmod +x $FILE
        
        FILE_NAME=$(basename "$FILE")
        echo "[INFO] Verificam fisierul $FILE_NAME"
    
        if cat $FILE | head -1 | grep -qx '#! /bin/bash'; then
        	echo "[INFO] Fisierul $FILE_NAME are shebang adaugat."
        	continue
        fi
        
        if [ ! -s $FILE ]; then
            echo "#! /bin/bash" > $FILE
        else
            sed -i '1i #! /bin/bash' $FILE 
            echo "[INFO] Am adaugat shebang in fisierul $FILE_NAME."
        fi
    fi
done


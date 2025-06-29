#! /bin/bash

# Faceti un script cu numele config.sh ce face load în variabilele de mediu la variabilele definite intr-un fisier config.txt ce arată în felul următor:

# DB_USER:admindb
# DB_PASS:12343dsadasdasFDTR!@13
# DB_HOSTNAME:my-db.com 
# DB_PORT:1234

for line in $(cat config.txt);do
    key=$(echo $line | awk -F":" '{print $1}')
    value=$(echo $line | awk -F":" '{print $2}')
    echo "[INFO] Set $key to value $value"
    if [[ -z "$key" || -z "$value" ]]; then
        echo "[WARNING] Key or Value empty. Skip it"
        continue
    fi
    export $key=$value
    echo "[INFO] Check that var $key is set to value: $value"
    value_set=$(printenv | grep -w $key)
    if [ "$value_set" != "$key=$value" ]; then
        echo "[ERROR] The value was not set"
    else
        echo "[INFO] The value of $key is $value_set"
    fi
done


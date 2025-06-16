#! /bin/bash

# Scrieți un script care verifica dacă un site este available (status code între 200 si 399). Scriptul verifică de un număr maxim de ori primit tot ca argument.	

# Example of 'bad' site https://httpstat.us/418

site=${1:-example.com}

echo "Check status of $site"

status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $site)

if (( status_code >= 200 && $status_code < 400 )); then
    echo "[INFO] Site is UP. Status code  $status_code"
else
    echo "[ERROR] Site is down. Status code $status_code"
    exit 1
fi

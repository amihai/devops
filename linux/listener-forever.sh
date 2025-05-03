#!/bin/bash

# Folosește primul argument ($1) dacă există, altfel default 8080
PORT=${1:-8080}

echo "Listening on port $PORT..."

while true; do
    nc -l -p "$PORT"
    echo "Connection closed. Listening again..."
done


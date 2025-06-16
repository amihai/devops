#! /bin/bash

# Adaugati in variabila de mediu PATH directorul cu calea ~/bin-itschools/ doar dacă acesta exista. Faceți acest lucru în mod automat de fiecare data cand se porneste o sesiune cu login pentru userul curent. Adaugati un script în acel director și încercați să-l executați de oriunde.

if [ -d "$HOME/bin-itschool/" ]; then
    export PATH="$HOME/bin-itschools/:$PATH"
fi

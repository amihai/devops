# Faceți un script de python ce verifica dacă nivelul de ocupare al discului este mai mare de un prag (configurabil - implicit 90%). În cazul în care ocuparea discului este mai mare de acest prag printeaza un mesaj de alertă în consola.
# Puneti acest script sa ruleze in ~/.bashrc

import subprocess 
import sys
import logging


logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

PRAG_ALERTA_DEFAULT = 90

if len(sys.argv) < 2: 
    logging.warning(f"Pragul de alerta nu este configurat. Se considera pragul implicit de {PRAG_ALERTA_DEFAULT}%.")
    prag_alerta = PRAG_ALERTA_DEFAULT
else: 
    try:
        prag_alerta = int(sys.argv[1].replace('%', ' '))
        if prag_alerta < 0 or prag_alerta > 100:
            raise ValueError("Pragul trebuie sa fie un numar intreg intre 0-100.")
    except ValueError as error:
        logging.error(f"Pragul introdus nu este valid. {error}")
        sys.exit(1)


rezultat_comanda = subprocess.run("df -h / | awk '{print $5}' | tail -1 | tr '%' ' '", shell=True, capture_output=True, text=True)

utilizare_disk = int(rezultat_comanda.stdout)

if utilizare_disk > prag_alerta:
    print(f"[ALERTA] --- Disk aproape plin: {utilizare_disk}% ---")
    print(f"[DEBUG] Folositi comanda: 'du -h --max-depth=1 / 2> /dev/null | sort -hr'")


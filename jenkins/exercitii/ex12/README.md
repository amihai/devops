# Instrucțiuni de rulare

## Instalează dependențele:

```bash
pip install -r requirements.txt
```

## Rulează serverul Flask:

```bash
python3 app.py
```

Se va deschide pe: http://localhost:8090

Merge deschis si din masina Host (Windows 11) pe IP-ul de bridge.

## Rulează testele cu Pytest:

```bash
pytest test_app.py
```

## Rulează lint cu flake8:

```bash
flake8 app.py test_app.py

# Sau asa pentru toate fisierele
flake8 .

# Incearca sa pui un rand gol in plus la sfarsit sau sa scoti din randurile goale de la inceput si ruleaza iar lint-ul

# Dacă vrei să ignori unele reguli comune:
flake8 --ignore=E501,W503 app.py test_app.py

```

# Dockerfile – Build pentru serverul Flask

```bash
docker build -t python-simple-app .
docker run -p 8090:8090 python-simple-app
```

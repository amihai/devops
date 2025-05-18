# Sintaxa if-then-else with command

```bash
if command; then
    echo "Comanda a avut succes (exit code 0)"
else
    echo "Comanda a eșuat (exit code diferit de 0)"
fi
```

Sau negatia

```bash
if ! command; then
    echo "Comanda a eșuat (exit code diferit de 0)"
else
    echo "Comanda a avut succes (exit code 0)"
fi
```
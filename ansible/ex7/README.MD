# Ex 7

Daca nginx este instalat pe masina, adaugati un fisier cu numele salut.html in nginx ce contine un mesaj primit ca parametru in ansible.

## Comenzi

```bash

ansible-playbook -i inventory.ini -e nume=Andrei salut.yaml

```

Open in browser: http://localhost/salut.html

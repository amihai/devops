# Ex 12

Copiază un script de pe mașina locală pe un host remote și îl rulează.

Acest playbook demonstrează cum să:
- Copiezi un fișier script de pe mașina locală pe un host remote folosind modulul `copy`
- Setezi permisiunile corecte pentru script (executabil)
- Rulezi scriptul pe host-ul remote folosind modulul `command`
- Afișezi output-ul scriptului

## Comenzi

```bash

ansible-playbook -i inventory.ini copy-and-run-script.yaml

```

## Resurse

- https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html
- https://docs.ansible.com/ansible/latest/collections/ansible/builtin/command_module.html


# Ex 8

Creati un fisier de secrete.yaml cu valut ce contine 2 variabile: db_user si db_password. Folositi apoi variabilele din acel secret file intr-un playbook.

```bash

ansible-vault create secrets.yml
cat secrets.yml
ansible-vault edit secrets.yaml
ansible-vaule view secrets.yaml

ansible-playbook -i inventory.ini db-connect.yaml --ask-vault-pass

echo "parola vault" > .vault_pass.txt
chmod 600 .vaul_pass.txt

ansible-playbook -i inventory.ini db-connect.yaml --vault-password-file .vault_pass.txt

ansible-vault encrypt file.yaml
ansible-vault rekey file.yaml
ansible-vault decrypt file.yaml
```

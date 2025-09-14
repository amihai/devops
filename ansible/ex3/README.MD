# Ex3

Ruleaza un playbook care creează un fișier /tmp/test.txt pe hostul remote (server) cu următoarele permisiuni (u=rw,g=rw,o=r).

## Comenzi

```bash

ansible-playbook -i inventory.ini create-empty-file.yaml
ansible-doc file

```

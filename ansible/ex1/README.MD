# Ex1: Ruleaza comenzi din command line

## Comenzi

```bash

ansible database -i inventory.ini -m ping
ansible all -i inventory.ini -m ping 

# ia inventory din locatia default: /etc/ansible/hosts
ansible all -m ping


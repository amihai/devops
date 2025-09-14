# Ex4

Creează un playbook care instalează nginx pe un host Ubuntu (pe server).
See: https://ubuntu.com/tutorials/install-and-configure-nginx#2-installing-nginx 

## Comenzi

```bash

ansible-playbook -i inventory.ini install-nginx.yaml
ansible-playbook -i inventory.ini clean-install-nginx.yaml

# Pe masina remote
service status nginx
ls /var/www/html/  

```

# Ex 11

Un role care instalează și pornește nginx pe un server Ubuntu

## Comenzi

```bash
ansible-galaxy init nginx_role
tree nginx_role
ansible-playbook -i inventory.ini site.yaml
```
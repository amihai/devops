# Exercițiu 7: EC2 cu cheie SSH

## Descriere

Acest exercițiu demonstrează cum să creezi o instanță EC2 în AWS cu o cheie SSH pentru acces securizat.

## Resurse create

1. **SSH Key Pair** - Cheie SSH pentru autentificare
2. **VPC** - Virtual Private Cloud pentru izolare
3. **Subnet** - Subnet public pentru instanța EC2
4. **Security Group** - Grup de securitate cu reguli pentru SSH (port 22) și HTTP (port 80)
5. **EC2 Instance** - Instanță EC2 cu cheia SSH configurată

## Cum să rulezi

### Folosind LocalStack (pentru testare locală)

```bash
# Pornește LocalStack
docker run -d -p 4566:4566 localstack/localstack

# Inițializează Terraform
terraform init

# Verifică configurația
terraform plan

# Aplică configurația
terraform apply

# Vezi outputurile
terraform output

# Distruge resursele
terraform destroy
```

## Outputs

După ce aplici configurația, vei vedea:
- ID-ul instanței EC2
- Adresa IP publică
- Numele cheii SSH
- Fingerprintul cheii SSH
- Comanda de conectare SSH

## Note

- Acest exemplu este configurat pentru LocalStack (testare locală)
- Pentru a folosi pe AWS real, șterge secțiunea `endpoints` din provider și configurează credențialele AWS
- Cheia publică SSH din exemplu este una de test - folosește propria cheie în producție

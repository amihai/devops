# Cream o cheie de ssh, o citim cu data si o afisam cu output

# Comenzi:
# terraform init
# terraform plan
# terraform apply
# awslocal ec2 describe-key-pairs # Observati key-1
# terraform destroy  # Observati ca a disparut key-1

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
  }
}

# Creează cheia dacă nu există deja (manual gestionezi unicitatea numelui)
resource "aws_key_pair" "my_key" {
  key_name   = "key-1"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Citește cheia (folosim data pentru a exemplifica)
data "aws_key_pair" "my_key" {
  key_name = aws_key_pair.my_key.key_name
}

# Afișează fingerprintul cheii adăugate
output "ssh_key_fingerprint" {
  value = data.aws_key_pair.my_key.fingerprint
}


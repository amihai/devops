# Cream o cheie de ssh cu numele `key-2` inafara terraform (direct din awslocal) si verificam daca o putem lista cu terraform.

# Comenzi:
# awslocal ec2 create-key-pair --key-name key-2
# awslocal ec2 describe-key-pairs # Observati key-2

# terraform init
# terraform plan
# terraform apply

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

# Citeste o cheie construita inafara terraform
data "aws_key_pair" "my_key" {
  key_name = "key-2"
}

# Afișează fingerprintul cheii adăugate
output "ssh_key_fingerprint" {
  value = data.aws_key_pair.my_key.fingerprint
}


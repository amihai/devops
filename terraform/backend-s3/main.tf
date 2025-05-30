# Faceți un script de terraform ce creaza o pereche de chei de SSH si tine tfstate-ul intr-un S3 bucket.

# awslocal s3api create-bucket --bucket terraform-state
# awslocal s3 ls s3://terraform-state/

terraform {
  backend "s3" {
    bucket         = "terraform-state-dev"
    key            = "state.tfstate"
    region         = "us-east-1"
    access_key     = "test"
    secret_key     = "test"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    endpoints = {
        s3  = "http://localhost:4566"
        ec2 = "http://localhost:4566"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98"
    }
  }
}


provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  s3_use_path_style           = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3  = "http://localhost:4566"
  }
}

# Creează cheia dacă nu există deja (manual gestionezi unicitatea numelui)
resource "aws_key_pair" "my_key" {
  key_name   = "key-3"
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


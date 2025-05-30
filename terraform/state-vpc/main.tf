# Creati un VPC din terraform. Stergeti VPC-ul direct din AWS (LocalStack) si apoi rulati terraform refresh si verificati ca state file-ul a fost modificat corect. Rulati apoi terraform plan si iar apply. 

# terraform apply
# terraform show

# awslocal ec2 describe-vpcs
# awslocal ec2 delete-vpc --vpc-id vpc-94bae3b08d365b957

# terraform refresh
# terraform show

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

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

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


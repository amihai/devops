terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true
  endpoints {
    ec2 = "http://localhost:4566"
    s3      = "http://localhost:4566"
    rds     = "http://localhost:4566"
    iam     = "http://localhost:4566"
    sns = "http://localhost:4566"
    sqs = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
    route53 = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
  }
}

# Creează secretul
resource "aws_secretsmanager_secret" "db_secret" {
  name        = "tema-db-password"
  description = "Username si Parola bazei de date"
}

# Stochează valoarea secretului
resource "aws_secretsmanager_secret_version" "db_password_value" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
  })
}


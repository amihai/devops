# Create 2 bucket-uri de S3, unul cu `prevent_destroy = true` si celalat fara. Dati destroy la ele si apoi list in aws local.


# terraform init
# terraform apply

# awslocal s3 ls
# terraform destroy # arunca eroare si nimic nu este sters
# awslocal s3 ls


terraform {
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


resource "aws_s3_bucket" "un-secure" {
  bucket = "my-non-critical-bucket"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket" "secure" {
  bucket = "my-critical-bucket"

  lifecycle {
    prevent_destroy = true
  }
}





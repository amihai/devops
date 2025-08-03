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
  }
}

resource "aws_s3_bucket" "imported_bucket" {
  bucket = "tema-import-bucket"
}

output "imported_bucket_name" {
  value = aws_s3_bucket.imported_bucket.id
}


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
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "tema-s3-bucket"
}

resource "aws_s3_object" "fisier1" {
  bucket = aws_s3_bucket.bucket.id
  key    = "folder/fisier1.txt"
  source = "${path.module}/fisier1.txt"
}

resource "aws_s3_object" "fisier2" {
  bucket = aws_s3_bucket.bucket.id
  key    = "folder/fisier2.txt"
  source = "${path.module}/fisier2.txt"
}

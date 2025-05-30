# Creeaza cate un bucket de S3 pentru dev si prod

# terraform init

# terraform workspace new dev
# terraform apply -auto-approve

# terraform workspace new prod
# terraform apply -auto-approve

# awslocal s3 ls

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-${terraform.workspace}"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

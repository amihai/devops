# Faceți un script de terraform ce creaza o instanta de EC2. Dati taint apoi la instanta

# terraform init
# terraform apply -auto-approve
# terraform taint aws_instance.ec2_test_tain
# terraform plan # Observati  aws_instance.ec2_test_tain is tainted, so must be replaced
# terraform apply # Observati ca resursa este intai distrusa si apoi recreata 


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

resource "aws_instance" "ec2_test_tain" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

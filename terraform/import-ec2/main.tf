# Creati o instanta de EC2 de mana in LocalStak si importati-o in terraform


# Daca nu exista deja trebuie intai creata cheia
# awslocal ec2 create-key-pair --key-name test-key

# Apoi cream EC2 instance cu image id ami-12345678 
# awslocal ec2 run-instances \
#  --image-id ami-12345678 \
#  --instance-type t2.micro \
#  --key-name test-key 

# Verificam ID-ul instantei create precendent
# awslocal ec2 describe-instances

# terraform init
# terraform import aws_instance.ec2_importat i-0abcd1234efgh5678
# terraform plan
# Terraform îți va spune ce lipsește în cod — trebuie să completezi în aws_instance toate atributele relevante (image_id, instance_type etc.) ca să nu încerce să facă modificări.
# terraform plan # Observam 0 modifications


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
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
  }
}


resource "aws_instance" "ec2_importat" {
  instance_type = "t2.micro"
  ami = "ami-12345678"
  
  # After:
}



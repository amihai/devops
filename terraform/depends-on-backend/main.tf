# Creati un subnet si apoi un EC2 instance in acel subnet. Folosiți depends_on ca sa va asigurati ca se creaza intai subnet-ul. Puneti in main.tf in ordinea “gresita” resursele ca sa observati ca indiferent de ordinea lor depends_on se asigura ca intai a fost create subnet-ul.



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

resource "aws_instance" "frontend" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  depends_on = [
    aws_instance.backend
  ]
}


resource "aws_instance" "backend" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}


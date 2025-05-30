# Creați un modul ce face o cheie de ssh si o instanta de EC2 ce poate fi accesată cu aceasta cheie de ssh.


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

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Subnet public
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

module "ec2_with_ssh" {
  source            = "./modules/ec2-with-ssh"
  key_name          = "my-ssh-key"
  public_key_path   = "~/.ssh/id_rsa.pub"
  ami_id            = "ami-0abcdef1234567890"
  instance_type     = "t3.micro"
  security_group_ids = ["sg-0123456789abcdef0"]
  subnet_id         = aws_subnet.public.id
  instance_name     = "my-ec2"
}

output "ec2_public_ip" {
  value = module.ec2_with_ssh.instance_public_ip # Asta e outputul definit in modul
}

 output "ec2_ssh_command" {
  value = module.ec2_with_ssh.ssh_command # Asta e outputul definit in modul
}


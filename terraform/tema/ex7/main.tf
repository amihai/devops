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
  }
}

# Creează o cheie SSH
resource "aws_key_pair" "ec2_key" {
  key_name   = "tema-ec2-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCehpxv6X3CBMrmpX9yMsXd46551PslbhV1CwBdqFibgRHaioYe1TPKHvCnsIMtMyQn9Sn7cWyLEZZsY01hp3WanqsZ+FppF591jfz2aLJ00Phyw6taL3WtSydydEbXNJ03T0wjKYY3D5SvKPQmfGRqOCMc+s1XpNJmGI1qD5t5zZZMdLf7b78xMw4Fkx/yIPHB9rRgILzAWWYwp9VvfeWXM4ijsLF2WzPCBmdqc3ZBsHvmZo9wDsMbgvvXbxNUi3JdPqRARhxCJCFn1gU4ttf0K50SejBZZ6QEiqXnY395/i/xc/Tl6RTKBX398G0ftEXIo1kOg8uVGXYXissxiktD user@example.com"
}

# Creează un VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "tema-vpc"
  }
}

# Creează un subnet public
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tema-public-subnet"
  }
}

# Creează un Security Group cu acces SSH
resource "aws_security_group" "ec2_sg" {
  name        = "tema-ec2-sg"
  description = "Security group pentru EC2 cu acces SSH"
  vpc_id      = aws_vpc.main_vpc.id

  # Permite SSH (port 22)
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permite HTTP (port 80)
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permite tot traficul de ieșire
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tema-ec2-sg"
  }
}

# Creează instanța EC2 cu cheia SSH
resource "aws_instance" "web_server" {
  ami                         = "ami-0c55b159cbfafe1f0"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ec2_key.key_name
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "tema-ec2-instance"
  }
}

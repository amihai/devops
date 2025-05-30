#  Creati un script terraform end-to-end care sa salveze statul in S3 si care sa creeze: 
# - VPC
# - Subnet
# - Internet Gateway
# - Route Table
# - Security Group
# - Key Pair
# - EC2 Instance
# - DNS
 

# terraform init
# terraform apply -var ami_id=ami-0c02fb55956c7d316 -var domain_name="example.com" -var ec2_hostname="ec2.example.com"  -auto-approve
# awslocal s3 cp s3://terraform-state-dev/terrafom-ec2-complet/state.tfstate - | cat
# awslocal route53 list-hosted-zones --region=us-east-1
# awslocal route53 list-resource-record-sets --hosted-zone-id 47ZKSOPYR5L86N5

terraform {
  backend "s3" {
    bucket         = "terraform-state-dev"
    key            = "terrafom-ec2-complet/state.tfstate"
    region         = "us-east-1"
    access_key     = "test"
    secret_key     = "test"
    use_path_style           = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    endpoints = {
        s3  = "http://localhost:4566"
        ec2 = "http://localhost:4566"
    }
  }

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


# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "main-vpc" }
}

# Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = { Name = "public-subnet" }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Route Table + Association
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}

# Security Group
resource "aws_security_group" "ssh" {
  name   = "ssh-access"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Key Pair
resource "aws_key_pair" "default" {
  key_name   = "my-key"
  public_key = file(var.public_key_path)
}

# EC2 Instance
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ssh.id]
  key_name                    = aws_key_pair.default.key_name
  associate_public_ip_address = true

  tags = {
    Name = "example-instance"
  }
}

# DNS: Creează zona DNS publică (ex: example.com)
resource "aws_route53_zone" "main" {
  name = var.domain_name
}

# DNS A record
resource "aws_route53_record" "ec2_dns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.ec2_hostname         # ex: "ec2.example.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.public_ip]
}




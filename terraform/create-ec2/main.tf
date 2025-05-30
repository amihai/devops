terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
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

resource "aws_key_pair" "localstack_key" {
  key_name   = "test-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCehpxv6X3CBMrmpX9yMsXd46551PslbhV1CwBdqFibgRHaioYe1TPKHvCnsIMtMyQn9Sn7cWyLEZZsY01hp3WanqsZ+FppF591jfz2aLJ00Phyw6taL3WtSydydEbXNJ03T0wjKYY3D5SvKPQmfGRqOCMc+s1XpNJmGI1qD5t5zZZMdLf7b78xMw4Fkx/yIPHB9rRgILzAWWYwp9VvfeWXM4ijsLF2WzPCBmdqc3ZBsHvmZo9wDsMbgvvXbxNUi3JdPqRARhxCJCFn1gU4ttf0K50SejBZZ6QEiqXnY395/i/xc/Tl6RTKBX398G0ftEXIo1kOg8uVGXYXissxiktD eu@cloud-aws" # pune orice cheie publică validă
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_security_group" "main_sg" {
  name        = "test-sg"
  description = "Allow all inbound traffic (for test)"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "test_ec2" {
  ami           = "ami-12345678"  # orice string, LocalStack nu verifică
  instance_type = "t2.micro"
  key_name      = aws_key_pair.localstack_key.key_name
  subnet_id     = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]

  tags = {
    Name = "TestInstanceLocal"
  }
}



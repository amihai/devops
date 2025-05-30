# Afisati toate availability zones dintr-o regiune

# terraform init
# terraform plan -var="nume_regiune=us-east-1"
# terraform apply -var="nume_regiune=us-east-1"


variable "nume_regiune" {
  description = "Numele Regiunii"
  type        = string
  default     = "us-east-1" # Valoarea implicita in caz ca nu se paseaza -var

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = var.nume_regiune # Specific LocalStack
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    ec2 = "http://localhost:4566"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "zone_names" {
  value = data.aws_availability_zones.available.names
}

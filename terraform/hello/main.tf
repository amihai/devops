# Afiseaza un mesaj de salut intr-un fisier  

# terraform init
# terraform plan -var="nume_cursant=Eugen Ionesco"
# terraform apply -var="nume_cursant=Eugen Ionesco"
# terraform apply -var-file="local.tfvars"
# Sau:
# export TV_VAR_nume_cursant=Mimi

variable "nume_cursant" {
  description = "Numele cursantului"
  type        = string
  default     = "Popescu Ioana"
}


terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "hello_world" {
  filename = "${path.module}/hello.txt"
  content  = "Hello, ${var.nume_cursant}!"
}

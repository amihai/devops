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

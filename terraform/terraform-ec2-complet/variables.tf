variable "region" {
  default = "us-east-1"
}

variable "public_key_path" {
  description = "Path către cheia publică SSH"
  default     = "~/.ssh/id_rsa.pub"
}

variable "ami_id" {
  description = "ID-ul AMI (Amazon Linux 2 de exemplu)"
  type        = string
}

variable "domain_name" {
  description = "Domeniul înregistrat în Route 53"
  type        = string
  default     = "itschool.ro"
}

variable "ec2_hostname" {
  description = "Hostname-ul complet pentru EC2 (FQDN)"
  type        = string
  default     = "ec2.itschool.ro"
}



variable "key_name" {
  description = "Numele cheii SSH"
  type        = string
}

variable "public_key_path" {
  description = "Calea către fișierul cu cheia publică (ex: ~/.ssh/id_rsa.pub)"
  type        = string
}

variable "ami_id" {
  description = "AMI-ul pentru EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipul EC2 (ex: t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "security_group_ids" {
  description = "Lista de security groups"
  type        = list(string)
}

variable "subnet_id" {
  description = "Subnetul în care va fi instanța"
  type        = string
}

variable "instance_name" {
  description = "Numele instanței EC2"
  type        = string
}


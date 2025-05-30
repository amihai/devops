output "instance_public_ip" {
  description = "IP-ul public al instanței"
  value       = aws_instance.this.public_ip
}

output "ssh_command" {
  description = "Comanda SSH recomandată"
  value       = "ssh -i <private_key_file> ec2-user@${aws_instance.this.public_ip}"
}

# Afișează ID-ul instanței EC2
output "instance_id" {
  description = "ID-ul instanței EC2 create"
  value       = aws_instance.web_server.id
}

# Afișează IP-ul public al instanței
output "instance_public_ip" {
  description = "Adresa IP publică a instanței EC2"
  value       = aws_instance.web_server.public_ip
}

# Afișează numele cheii SSH
output "ssh_key_name" {
  description = "Numele cheii SSH folosite pentru instanța EC2"
  value       = aws_key_pair.ec2_key.key_name
}

# Afișează fingerprintul cheii SSH
output "ssh_key_fingerprint" {
  description = "Fingerprintul cheii SSH"
  value       = aws_key_pair.ec2_key.fingerprint
}

# Afișează comanda SSH pentru conectare
output "ssh_connection_command" {
  description = "Comanda pentru a te conecta la instanță via SSH"
  value       = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.web_server.public_ip}"
}

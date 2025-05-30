output "public_ip" {
  description = "IP-ul public al instanței EC2"
  value       = aws_instance.web.public_ip
}

output "ssh_command" {
  description = "Comanda pentru conectare SSH"
  value       = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.web.public_ip}"
}


output "ec2_dns" {
  value = aws_route53_record.ec2_dns.name
}

output "ssh_with_dns" {
  value = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_route53_record.ec2_dns.name}"
}

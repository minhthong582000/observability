output "ssh_monitoring_instance" {
  value = aws_instance.monitoring[*].public_ip
}

output "instances_private_ip" {
  value = aws_instance.monitoring[*].private_ip
}

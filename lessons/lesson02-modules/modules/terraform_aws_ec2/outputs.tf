
output "public_ip" {
  description = "Public IP address of instance(s)"
  value       = aws_instance.instance.*.public_ip
}
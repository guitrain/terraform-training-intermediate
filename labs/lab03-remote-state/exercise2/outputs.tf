output "id" {
    description = "The instance ID"
    value       = aws_instance.ec2.id
}

output "arn" {
    description = "The ARN of the instance"
    value       = aws_instance.ec2.arn
}

output "public_ip" {
    description = "The public IP address assigned to the instance"
    value       = aws_instance.ec2.public_ip
}
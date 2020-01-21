output "vpc_id" {
  description = "VPC id"
  value       = "${module.vpc.vpc_id}"
}

output "public_ip" {
  description = "Public IP addresses for each instance created"
  value       = "${module.ec2.public_ip}"
}

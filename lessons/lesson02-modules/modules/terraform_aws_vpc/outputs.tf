
output "vpc_id" {
  description = "VPC id"
  value       = "${aws_vpc.vpc.id}"
}

output "pub_subnet_id" {
  description = "Public subnet id"
  value       = "${aws_subnet.pub-subnet.id}"
}

output "pri_subnet_id" {
  description = "Private subnet id"
  value       = "${aws_subnet.pri-subnet.id}"
}

output "ig_id" {
  description = "Internet Gateway id"
  value       = "${aws_internet_gateway.ig.id}"
}

output "pub_route_table_id" {
  description = "Public Route Table id"
  value       = "${aws_route_table.pub-route-table.id}"
}


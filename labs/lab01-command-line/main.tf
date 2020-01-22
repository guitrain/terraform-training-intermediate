# ---------------------------------------------------------------------------------------------------------------------
# DEFIINE SUPPORTED TERRAFORM VERSIONS
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# INCLUDE THE AWS PROVIDER
# The aws provider will be leveraged to provision aws resources
# https://www.terraform.io/docs/providers/aws/index.html
#---------------------------------------------------------------------------------------------------------------------
provider "aws" {
  region     = var.region
}


# ---------------------------------------------------------------------------------------------------------------------
# DEFINE RESOURCES
# Define resources to build a VPC and EC2 instance(s)
# ---------------------------------------------------------------------------------------------------------------------

# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

# Create VPC Gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
}

# Define Subnets
resource "aws_subnet" "pri-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pri_cidr_block
  availability_zone = var.pri_availability_zone
}

resource "aws_subnet" "pub-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pub_cidr_block
  availability_zone = var.pub_availability_zone
}

# Define route tables and routes
resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.pub_route_cidr_block
    gateway_id = aws_internet_gateway.ig.id
  }
}

resource "aws_route_table_association" "pub-routes" {
  subnet_id      = aws_subnet.pub-subnet.id
  route_table_id = aws_route_table.pub-route-table.id
}

# Create Security Group (port http, https and ssh access)
resource "aws_security_group" "web-dmz" {
  name        = "web-dmz"
  description = "Public facing security group"
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "allow_ssh" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = aws_security_group.web-dmz.id
}

resource "aws_security_group_rule" "allow_http" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = aws_security_group.web-dmz.id
}

resource "aws_security_group_rule" "allow_https" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = aws_security_group.web-dmz.id
}

# Provision ec2 instance(s)
resource "aws_instance" "instance" {

  count = var.instance_count

  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${aws_security_group.web-dmz.id}"]
  subnet_id                   = aws_subnet.pub-subnet.id
  associate_public_ip_address = true

  tags = {Name = "${format("%s-%d", var.server_name, count.index+1)}"}
}




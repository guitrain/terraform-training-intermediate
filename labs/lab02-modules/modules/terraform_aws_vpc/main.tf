# ---------------------------------------------------------------------------------------------------------------------
# DEFIINE SUPPORTED TERRAFORM VERSIONS
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}

# Provision VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = var.tags
}

# Provision VPC Gateway
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


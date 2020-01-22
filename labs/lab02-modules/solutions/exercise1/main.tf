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
  region = "us-east-1"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEFINE RESOURCES
# Reference modules which define the resources to build a VPC and EC2 instance(s)
# ---------------------------------------------------------------------------------------------------------------------

# Provision VPC
module "vpc" {
  source = "../../modules/terraform_aws_vpc"

  vpc_name              = "aheadtst"
  vpc_cidr_block        = "10.0.0.0/16"
  pri_cidr_block        = "10.0.1.0/24"
  pri_availability_zone = "us-east-1a"
  pub_cidr_block        = "10.0.2.0/24"
  pub_availability_zone = "us-east-1b"
  pub_route_cidr_block  = "0.0.0.0/0"

  tags = {
    Name  = "tfevpc"
    Owner = "AHEAD LLC Cloud Team"
  }
}

# Provision Security Group 
module "sg" {
  source = "../../modules/terraform_aws_sg"

  vpc_id = module.vpc.vpc_id
}

# Provision EC2 instance(s)
module "ec2" {
  source                      = "../../modules/terraform_aws_ec2"
  instance_count              = 2
  ami                         = "ami-6871a115"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [module.sg.sg_id]
  subnet_id                   = module.vpc.pub_subnet_id
  associate_public_ip_address = true
  server_name                 = "aheadweb"
  tags = {
    Owner = "AHEAD LLC Cloud Team"
  }
}


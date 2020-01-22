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
  region  = "us-east-1"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEFINE RESOURCES
# Reference modules which define the resources to build a VPC and EC2 instance(s)
# ---------------------------------------------------------------------------------------------------------------------
data "aws_region" "current" {}

# Provision VPC
/*
Add vpc module here. See module README.md for usage
*/

# Provision Security Group 
/*
Add security group module here. See module README.md for usage
*/

# Provision EC2 instance(s)
/*
Add ec2 module here. See module README.md for usage
*/


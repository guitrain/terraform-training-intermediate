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
# CONFIGURE REMOTE STATE BACKEND
# Coonfigure terraform to reference previously created S3 bucket and dynamoDB table for remote state management
#---------------------------------------------------------------------------------------------------------------------
terraform {
  backend "s3" {
    bucket         = "<YOUR S3 BUCKET>"
    bucket         = "tempaheadtrainingbucketlesson03"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "<YOUR DYNAMODB TABLE>"
    dynamodb_table = "statefilelock"
    encrypt        = true
  }
}

# Provision an EC2 instance to test that the statefile gets stored in the remote backend
resource "aws_instance" "ec2" {
  ami                         = "ami-6871a115"
  instance_type               = "t2.micro"
}

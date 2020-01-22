# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "awsprofile" {
  description = "AWS profile for account the resources are being provisioned in"
  type        = string
}

variable "pri_availability_zone" {
  description = "AZ for the private network"
  type        = string
}

variable "pub_availability_zone" {
  description = "AZ for the public network"
  type        = string
}

variable "pri_cidr_block" {
  description = "Private subnet CIDR block"
  type        = string
}

variable "pub_cidr_block" {
  description = "Public subnet CIDR block"
  type        = string
}

variable "pri_subnet_name_tag" {
  description = "Private subnet Name tag"
  type        = string
}

variable "pub_subnet_name_tag" {
  description = "Public subnet Name tag"
  type        = string
}

variable "pub_route_cidr_block" {
  description = "Route for public CIDR block"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  description = "Region to deploy infrastructure to"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "ID of Amazon Machine Image to use for the instance"
  type        = string
  default     = "ami-6871a115"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have an associated public IP address"
  type        = bool
  default     = false
}

variable "server_name" {
  description = "Server Name"
  type        = string
  default     = "cctest"
}

variable "instance_count" {
  description = "How many ec2 instances you want to provision"
  type        = number
  default     = 1
}

variable "environment" {
  description = "What environment does this resource belong to"
  type        = string
  default     = "Undefined"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}




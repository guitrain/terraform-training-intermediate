# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "server_name" {
  description = "Server Name"
  type        = string
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}

variable "ami" {
  description = "ID of Amazon Machine Image to use for the instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group ids to associate with"
  type        = list(string)
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

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

variable "instance_count" {
  description = "How many instances to provision"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Map of required tags"
  type        = map
  default     = {}
}
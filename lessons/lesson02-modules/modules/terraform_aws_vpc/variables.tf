# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "vpc_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "vpc_cidr_block" {
  description = "Cidr block assigned to this VPC"
  type        = string
}

variable "pub_cidr_block" {
  description = "Public subnet block"
  type        = string
}

variable "pub_availability_zone" {
  description = "Public availaility zone"
  type        = string
}

variable "pri_cidr_block" {
  description = "Private subnet block"
  type        = string
}

variable "pri_availability_zone" {
  description = "Private availaility zone"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}

variable "pub_route_cidr_block" {
  description = "Route table route CIDR block"
  type        = string
  default     = "0.0.0.0/0"
}
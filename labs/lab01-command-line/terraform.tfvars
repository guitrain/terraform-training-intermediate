# AWS variables
region = "us-east-1"
awsprofile = "aheadPublicCloudDemo"

# environment variables
environment = "test"

# vpc variables
vpc_cidr_block = "10.0.0.0/16"
pri_availability_zone = "us-east-1a"
pri_cidr_block = "10.0.1.0/24"
pri_subnet_name_tag = "ccprinet"
pub_availability_zone = "us-east-1b"
pub_cidr_block = "10.0.2.0/24"
pub_subnet_name_tag = "ccpubnet"
pub_route_cidr_block = "0.0.0.0/0"

# ec2 variables
server_name = "ccwebinst"
instance_type = "t2.micro"
associate_public_ip_address = true
ami = "ami-6871a115"
instance_count = 2

# ---------------------------------------------------------------------------------------------------------------------
# DEFIINE SUPPORTED TERRAFORM VERSIONS
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}

# Configure terraform remote state to retrieve state data from the bucket we 
# created in previous exercises
data "terraform_remote_state" "ec2_instance_exercise2" {
    backend = "s3"
    config = {
        bucket  = "<BUCKET NAME>"
        key     = "terraform.tfstate"
        region  = "us-east-1"
    }
}

# Print out specific attributes from the state retriieved above
output "ec2_instance_exercise2_id" {
    description = "Instance ID of EC2 instance provisioned in exercise 2"
    value       = <FILL IN DATA REFERENCE>
}

output "ec2_instance_exercise2_arn" {
    description = "ARN of EC2 instance provisioned in exercise 2"
    value       = <FILL IN DATA REFERENCE>
}

output "ec2_instance_exercise2_public_ip" {
    description = "Public IP address of EC2 instance provisioned in exercise 2"
    value       = <FILL IN DATA REFERENCE>
}

# Print out all attributes from the state retrieved in the a remote state 
# config block above
output "ec2_instance_exercise2_all_attributes" {
    description = "All attributes of the configuration state from exercise 2"
    value       = <FILL IN DATA REFERENCE>
}

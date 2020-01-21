# Security Group Terraform Module

Provision an AWS Security Group with a pre-defined list of rules to allow SSH, HTTP and HTTPS access.

## Terraform Versions

Terraform 0.12. Supports all versions

## Usage

```
# Provision Security Group 
module "sg" {
  source = "./terraform_aws_sg"

  vpc_id = "vpc-0443239i9i5dd9768"
}
```

## Inputs

| Name                        | Description | Type            | Default  | Required |
|-----------------------------|-------------|-----------------|----------|----------|
| vpc_id                      | VPC Id      | string          | N/A      | Yes      |

## Outputs

| Name  | Description       |
|-------|-------------------|
| sg_id | Security Group Id |

## Authors

AHEAD LLC
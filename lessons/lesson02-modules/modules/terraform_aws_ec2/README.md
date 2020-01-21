# EC2 Terraform Module

Provision AWS EC2 instances

## Terraform Versions

Terraform 0.12. Supports all versions

## Usage

```
# Provision EC2 instance(s)
module "ec2" {
  source = ./terraform_aws_ec2"

  instance_count              = 2
  ami                         = "ami-6871a115"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["sg-005by375b1e42a8c", "sg-02614b4d6366f2848"]
  subnet_id                   = "subnet-00327f70399992b58"
  associate_public_ip_address = true
  server_name                 = "aheadweb"

  tags = {
    Owner   = "AHEAD LLC Cloud Team"
  }
}
```

## Inputs

| Name                        | Description                                                         | Type            | Default  | Required |
|-----------------------------|---------------------------------------------------------------------|-----------------|----------|----------|
| instance_count              | How many instances to provision                                     | number          | 1        | No       |
| ami                         | ID of Amazon Machine Image to use for the instance                  | string          | N/A      | Yes      |
| instance_type               | The type of instance to start                                       | string          | t2.micro | No       |
| vpc_security_group_ids      | A list of VPC security group ids to associate with                  | list of strings | N/A      | Yes      |
| subnet_id                   | The VPC Subnet ID to launch in                                      | string          | N/A      | Yes      |
| associate_public_ip_address | If true, the EC2 instance will have an associated public IP address | bool            | False    | No       |
| server_name                 | Server name                                                         | string          | N/A      | Yes      |
| tags                        | Map of required tags                                                | map             | No tags  | No       |

## Outputs

| Name      | Description                      |
|-----------|----------------------------------|
| public_ip | Public IP address of instance(s) |

## Authors

AHEAD LLC
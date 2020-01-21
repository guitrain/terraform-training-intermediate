# VPC Terraform Module

Provision an AWS VPC with accompanying VPC Gateway, private and public subnets and route table

## Terraform Versions

Terraform 0.12. Supports all versions

## Usage

```
# Provision VPC
module "vpc" {
  source = "./terraform_aws_vpc"

  vpc_name              = "aheadtst"
  vpc_cidr_block        = "10.0.0.0/16"
  pri_cidr_block        = "10.0.1.0/24"
  pri_availability_zone = "us-east-1a"
  pub_cidr_block        = "10.0.2.0/24"
  pub_availability_zone = "us-east-1b"
  pub_route_cidr_block  = "0.0.0.0/0"

  tags = {
    Name    = "tfevpc"
    Owner   = "AHEAD LLC Cloud Team"
  }
}
```

## Inputs

| Name                  | Description                                        | Type   | Default   | Reqired |
|-----------------------|----------------------------------------------------|--------|-----------|---------|
| pri_availability_zone | Private availaility zone                           | string | N/A       | Yes     |
| pri_cidr_block        | Private subnet block                               | string | N/A       | Yes     |
| pub_availability_zone | Public availaility zone                            | string | N/A       | Yes     |
| pub_cidr_block        | Public subnet block                                | string | N/A       | Yes     |
| pub_route_cidr_block  | Route table route CIDR block                       | string | 0.0.0.0/0 | No      |
| tags                  | A map of tags to add to all resources              | map    | No tags   | No      |
| vpc_cidr_block        | Cidr block assigned to this VPC                    | string | N/A       | Yes     |
| vpc_name              | Name to be used on all the resources as identifier | string | N/A       | Yes     |

## Outputs

| ig_id              | Internet Gateway id   |
|--------------------|-----------------------|
| pri_subnet_id      | Private subnet id     |
| pub_route_table_id | Public Route Table id |
| pub_subnet_id      | Public subnet id      |
| vpc_id             | VPC id                |

## Authors

AHEAD LLC
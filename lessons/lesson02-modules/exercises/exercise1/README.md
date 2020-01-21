# Lesson 2 Exercise 1 - Local modules and module output references

In this exercse we will learn how to source and use local modules, and how to use the outputs of one module as the input to another module or resource configuration.

The configuration here will provision resources using the following 3 modules :-

* terraform_aws_vpc - provision an AWS VPC
* terraform_aws_sg  - provision AWS Security Groups
* terraform_aws_ec2 - provision AWS ec2 instance(s)

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer. 
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

Please note that this code was written for Terraform 0.12.x.

## Quick start

The Terraform configuration will provision 

* a VPC network
* Security Group
* EC2 instance(s)

Configure your [AWS access 
keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as 
environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

or add keys to ~/.aws/credentials, example:-

```
$ cat ~/.aws/credentials
[default]
aws_access_key_id = AKHSOIFHQNJNDLKASJSQ
aws_secret_access_key = YALKSJDNjjKSPPLL/DEkwslkm/WKSslqwewmas
$
```

## Exercise

1. Use the modules provided to provision 

- a single VPC
- pre-defnied security groups
- 2 ec2 instances

For network range inputs, feel free to use any 10.0.x.x ranges a this is just an exercise and the networks will be provisioned within your own personal VPC.

```
NOTE: Both Security Group and EC2 modules will make use of outputs from the VPC module as inputs
```

2. Create output for the following

* VPC Id
* Puplic IP addresses of instances created

Verify these outputs correctly show up in the consol output of a _terraform apply_ 

```
NOTE: Solutions can be found in the 'solutions' directory if help is needed
```

Move on to exercise 2

## DO NOT run 'terraform destroy' at the end of this exercise as the resources will be used in the next exercise.
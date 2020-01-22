# Exercise 1 - Local modules and module output referencing

In this exercise we will learn how to source and use local modules, and how to use the outputs of one module as the input to another module or resource configuration.

The configuration here will provision resources using the following 3 modules:

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

1. Use the modules provided to provision:

- a single VPC
- pre-defined security groups
- 2 ec2 instances

In the main.tf file, you will see the following instructions:

```
# Provision VPC
/*
Add vpc module here. See module README.md for usage
*/

# Provision Security Group 
/*
Add security group module here. See module README.md for usage
*/

# Provision EC2 instance(s)
/*
Add ec2 module here. See module README.md for usage
*/
```

You will need to create a module block for each module required, provide a path to the module via
the 'source' parameter, and provide values for any required inputs.

Remember, a typical module configuration block looks like this:

```
    module "<NAME>" {
      source = <PATH TO MODULE>
      
      <input parameter assignments> 
    }
```

For network range inputs to the vpc module, feel free to use any 10.0.x.x ranges as this is just an exercise 
and the networks will be provisioned within your own personal VPC. 

Also note, both Security Group and EC2 modules will use outputs from the VPC module as inputs in those modules.

```
NOTE: Solutions can be found in the 'solutions' directory if help or direction is needed
```

2. Create outputs for the following:

* VPC Id
* Puplic IP addresses of instances created

Declare these outputs in the _outputs.tf_ file provided.

Verify these outputs correctly show up in the console output of a _terraform apply_.

```
NOTE: Solutions can be found in the 'solutions' directory if help is needed
```

Move on to exercise 2

## DO NOT run 'terraform destroy' at the end of this exercise as the resources will be used in the next exercise.

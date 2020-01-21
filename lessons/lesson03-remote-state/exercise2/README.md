# Demonstrate use of remote state backend

This folder contains example [Terraform](https://www.terraform.io/) configuration that create an 
[EC2](https://aws.amazon.com/ec2/) instance in [Amazon Web Services (AWS) account](http://aws.amazon.com/) and
stores and manages the state in the S3 [remote backend for Terraform](https://www.terraform.io/docs/backends/) 
we created iin the previous example.

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer. 
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

Please note that this code was written for Terraform 0.12.x.

## Quick start

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

In main.tf, fill in values for the following inputs :-

* __bucket__ - The name given to the bucket created in exercise 1
* __dynamedb_table__ - The name given to the dynamodb table created in exercise 1

Save you updates and deploy the code:

```
terraform init
terraform apply --auto-approve
```

Log on to the AWS console and verify that the state file has been created in your S3 bucket.

Now move on to exercise 3

## DO NOT run 'terraform destroy' at the end of this exercise as the resources will be used in the next exercise.



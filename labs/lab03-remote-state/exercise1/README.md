# Exercise 1 - S3 Remote State Creation

This folder contains example [Terraform](https://www.terraform.io/) configuration that create an 
[S3](https://aws.amazon.com/s3/) bucket and [DynamoDB](https://aws.amazon.com/dynamodb/) table in an 
[Amazon Web Services (AWS) account](http://aws.amazon.com/). The S3 bucket and DynamoDB table can be used as a 
[remote backend for Terraform](https://www.terraform.io/docs/backends/).

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

Specify a name for the S3 bucket in `variables.tf` by replacig "_UNIQUE BUCKET NAME_" with a bucket name 
in the __bucket_name__ variable. Do the same for "_TABLE NAME_" in the __table_name__ variable.

```
variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default     = <UNIQUE BUCKET NAME>
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "<TABLE NAME>"
}
```

```
NOTE: As suggested, S3 buck names MUST BE universally UNIQUE.
```

Deploy the code:

```
terraform init
terraform apply --auto-approve
```

Log on to the AWS console and verify that both the S3 bucket and DynamoDB tables have been created.

Move on to exercise 2

## DO NOT run 'terraform destroy' at the end of this exercise as the resources will be used in the next exercise.

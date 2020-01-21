# Exercise 3 - Demonstrate use of terraform_remote_state

This folder contains example [Terraform](https://www.terraform.io/) configuration that is used to demonstrate the use of the [terraform_remote_state](https://www.terraform.io/docs/providers/terraform/d/remote_state.html) data source. 

In the previous two exercises we created an S3 bucket and DynamoDB table to manage state, and then ran a configuration that used this S3 bucket as iits remote backend to store its state. In this final lesson we will demonstate how additional configurations can access a READ-ONLY copy of this terraform state to access outputs made available it in. The ability to do this is key to being able to segregate ownership of configurations and resources, but still make required data available for use by other teams. For example, the Network team owns and provisions all network resources in your AWS environment and thiis resouorce information is stored in its own state file owned and managed by the Network team. The application team want to provision EC2 instances and they will beed VPC ID information from the Network team. The Network team can configure the VPC ID as an output and the Application teams can then access the VPC ID usinig the terraform_remote_state data source.

In this exercise we will demonstrate this printing out all 3 of the EC2 outputs created in exercise 2 :-

* id - The EC2 instance ID
* arn - The ARN of the EC2 instance
* public_ip - The public IP address assigned to the instance

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

In main.tf, fill in values for the following :-

* _BUCKET NAME_ - the name of the bucket created in exercise 1
* _FILL IN DATA REFERENCE_ - the correct data reference that will print out each of correct values for each of the 4 outputs

```
HINT: The output value strings need to reference terraform_remote_state data source and the output name found in exercise 2 (and also listed above) for each attribute. An example can be found [here](https://www.terraform.io/docs/providers/terraform/d/remote_state.html_)

The solution is also available in this lessons _solutions_ folder.
```

Save you updates and deploy the code:

```
terraform init
terraform apply --auto-approve
```

The exercise is successfull if all 4 outputs are displated like follows:-

```
$ terraform apply --auto-approve
data.terraform_remote_state.ec2_instance_exercise2: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

ec2_instance_exercise2_all_attributes = {
  "arn" = "arn:aws:ec2:us-east-1:032876188954:instance/i-0b8fde0f15d4fb04e"
  "id" = "i-0b8fde0f15d4fb04e"
  "public_ip" = "52.23.196.183"
}
ec2_instance_exercise2_arn = arn:aws:ec2:us-east-1:032876188954:instance/i-0b8fde0f15d4fb04e
ec2_instance_exercise2_id = i-0b8fde0f15d4fb04e
ec2_instance_exercise2_public_ip = 52.23.196.183
$
```

The exercise is complete!

Clean exercise 1 and 2 when your done by running the following in each directory :

```
terraform destroy
```

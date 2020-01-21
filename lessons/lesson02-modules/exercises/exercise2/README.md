# Lesson 2 Exercise 2 - Remote modules and version referencing

In this exercse we will learn how to source and a modules stored in a repository in
GitHub, and how to reference specific versions of that module. The ability to reference
specific versions of a module is very important when it comes to adopting recommended
Continuous Integratiion best practices.

This should be a short module where we are usinig the configuration provided in the
previous exercise. In this exercise we will hope to :-

* replace the source of the local modules with a source path in GitHub
* demonstrate how different module versions can be references and why that is important

Terraforms reference material for this can be found [here](https://www.terraform.io/docs/modules/sources.html#github)

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

1. Replace the source of the local modules with a source path for the module GitHub. Also,
   reference version v1.0.0 of the module. 

   Versions of each of the local modules can be found at :-

   * [terraform-aws-vpc](https://github.com/conorcasey/terraform-aws-vpc.git)
   * [terraform-aws-sg](https://github.com/conorcasey/terraform-aws-sg.git)
   * [terraform-aws-ec2](https://github.com/conorcasey/terraform-aws-ec2.git)

   ```
   NOTE: For the purpose of this exercise the repositories have been made public and can be
   sources via HTTPS. Typically in a production evvironment however, repositories would 
   be private and it this case SSH is the recommended way to source modules as it avoids 
   having to pass any credentials as SSH keys can be configured.
   ```

   * Go to the main.tf file from the previous lesson and replace the local module source with
     the GitHub source, version v1.0.0. Terraforms reference material to help you determinie
     the correct syntax for the new source can be found [here](https://www.terraform.io/docs/modules/sources.html#github).
   * Once the updates are made, save your changes. The new module source will need to be 
     referenced. This can be done either via running 'terraform [init](https://www.terraform.io/docs/commands/init.html)' or 'terraform [get](https://www.terraform.io/docs/commands/get.html)'
   * run 'terraform apply --auto-approve'

2. Demonstrate how different module versions can be references and why that is important

   * Update the version of the terraform-aws-sg module in main.tf to so v1.0.1. This version 
     has removed the rule permitting SSH.
   * Execute __terraform init__ (or _terraform get__) to doownload the new version of the
     module
   * Execute __terraform plan__
     The plan should show that 1 resource is being deleted, the ssh security group rule,
     demonstrating that the new updated version of the module is being referenced. Feel free
     run __terraform apply --auto-approve__ to confirm. Otherwise the exercise is complete.
    
Clean up when you're done:

```
terraform destroy
```



```
NOTE: Solutions can be found in the 'solutions' directory if help is needed
```

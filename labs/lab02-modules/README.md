# Lab 2 - Modules

This lab will focus on modules and contains 2 short exercises. 

A [module](https://www.terraform.io/docs/modules/index.html) is a container for multiple resources that are used together. Modules can be 
used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly 
in terms of physical objects.

The configuration used in lab 1 has been broken up into 3 modules:

* terraform_aws_vpc
* terraform_aws_sg
* terraform_aws_ec2

The following exercises have been created to demonstrate some of the key thing to be familiar with when using module:

* Exercise 1 - Sourcing local modules and using the outputs from modules in your parent configuration
* Exercise 2 - [Sourcing modules in a Version Control System](https://www.terraform.io/docs/modules/sources.html#github) such as GitHub and referencing [specific versions](https://www.terraform.io/docs/modules/sources.html#selecting-a-revision-1) of modules



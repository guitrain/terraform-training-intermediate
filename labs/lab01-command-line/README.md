# Lab 1 - Terraform Command Line

The purpose of this exercise is to get familiar with some of the more important Terraform commands. Specifically, we 
will look at:-

* show
* state
* taint
* untaint
* import


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

Deploy the code:

```
terraform init
terraform apply --auto-approve
```

Now lets run some commands:

### [terraform show](https://www.terraform.io/docs/commands/show.html)

* `terraform show` - show all resource in statefile
* `terraform show -json | jq` - show statefile resources in JSON format

### [terrraform state](https://www.terraform.io/docs/commands/state/index.html)

* `terraform state list` - abbreviated list of all resources (only `<resource>.<name>`)
* `terraform state show <resource>.<name>` - show single resource from statefile. 

```
Example, lets show the state of the first resource printed in the previous command:
        
$ terraform state show aws_instance.instance[0]
        
NOTE: Because we used the count sub-command to iterate through the creation of X number of instances, these 
instances are stored in state as a list, and specific instances are references via their position in the list, 
just like an array. In the above example we are printing the first instance in the list. 
```

* `terraform state rm <resource>.<name>` - remove the specified resource from statefile. 
 
```
Let's remove the above instances from state with the following command:
        
$ terraform state rm aws_instance.instance[0]
        
Verify it is removed from state:
        
$ terraform state list
        
If we did a 'terraform destroy' it should destroy all resources provisioned by the configuration accept the 
instance we removed from state. Let's not do that however as we have additional steps in this lab still to complete.
```

### [terraform import](https://www.terraform.io/docs/commands/import.html)
* `terraform import <resource>.<name> <resourceID>`` - import an existing resource into terraform state.

Now let's add our instance back to terraform state using the _terraform import_ command. You will need the instance ID for
this instance to import it. The instance ID can be found a number of ways, the easiest being to either log into the AWS
Console and find it, or look back at the output from the _terraform state show aws_instance.instance[0]_ command we ran
earlier:
        
$ terraform import aws_instance.instance[0] <ec2_instance_id>

### [terraform taint](https://www.terraform.io/docs/commands/taint.html) / [untaint](https://www.terraform.io/docs/commands/untaint.html)

* `terraform taint <resource>.<name>` - marks a resource as tainted, forcing it to be destroyed and recreated on the next
apply

Let's mark a resource as tainted and then run a _terraform plan_ to confirm that this resource would be destroyed and
recreated:
        
$ terraform taint aws_instance.instance[1]
$ terraform plan
        
* `terraform untaint <resource>.<name>` - reverses a manual taint

Now let's run _terraform untaint_ on the resource to remove the taint status:
        
$ terraform untaint aws_instance.instance[1]

### [terraform graph](https://www.terraform.io/docs/commands/graph.html)

* `terraform graph | dot -Tpng > ~/Desktop/graph.png` -  (may need to 'brew install graphviz')

Cleanup the environment when finished:

* `terraform destroy --auto-approve`




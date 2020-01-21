# Lesson 3 - Remote State

This lesson will focus on [managing state remotely](https://www.terraform.io/docs/state/remote.html). By default, Terraform stores state locally in a file named terraform.tfstate as we've seen in earlier exercises. Storinig state locally has many drawbacks however, not lease of all the issues or concerns it raised with respect to collaboration, security and availability. Leveraging terraform supported [backends](https://www.terraform.io/docs/backends) to manage state remotely can address these issues.

This lesson includes the following exercises :-

* Exercise 1 - Leverage AWS S3 and DynamoDB to storage state and handle state file locking
* Exercise 2 - Demonstrate the use of the remote state backend created in exercise 1 to store state
* Exercise 3 - Demonstrate the use of the [terraform_remote_state](https://www.terraform.io/docs/providers/terraform/d/remote_state.html) data source to reference outputs from state
Method 1

Whenever we need a different instance type we need to update/modify the terraform.tfvars file

- Instead of changing in "terraform.tfvars" you can do the below steps:
	- Create a file called "stage.tfvars", "dev.tfvars" and "prod.tfvars"
- While executing the apply command, follow the below command:
terraform apply -var-file=stage.tfvars
terraform apply -var-file=dev.tfvars
terraform apply -var-file=prod.tfvars

Method 2

In this we introduced the workspace, with the help of workspace we can update/modify the created environment without changing the root environment.

How to create a new environment?

terraform workspace new stage
terraform workspace new dev
terraform workspace new prod

How to switch to a particular environment?

terraform workspace select stage
terraform workspace select dev
terraform workspace select prod

How to check in which environment we are?

terraform workspace show


- When you create the environment automatically a file called "terraform.tfstate.d" will be created.
- In terraform.tfvars you can change the "ami id" and "instance type" as per the requirement.
- When you run the terraform apply in any environment a separate "terraform.tfstate" will be created and it will create in a particular folder/environment and not in the root of the project.


Method 3

- Remove the value of instance_type from terraform.tfvar, so that it will pick from the lookup function and based on the environment you are in it will take that as primary and create the EC2 instance with the mentioned instance_type.

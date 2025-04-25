# Terraform ```.tfvars``` Files

In Terraform, ```.tfvars``` files are used to assign values to input variables defined in your configuration. These files typically have a ```.tfvars``` or ```.tfvars.json``` extension and are a powerful way to manage environment-specific settings and sensitive information.

Using ```.tfvars``` helps separate configuration data from your Terraform code, making your infrastructure more organized, flexible, and secure.

## Why Use ```.tfvars``` Files?

1. Configuration Separation
```.tfvars``` files let you keep variable values outside of your main Terraform configuration files. Instead of hardcoding values directly into ```.tf``` files, you define them in a ```.tfvars``` file. This promotes cleaner code and easier maintenance, especially when managing multiple environments (like dev, staging, and prod).

2. Secure Handling of Sensitive Data
They are useful for storing sensitive values like API keys, credentials, or secrets. Since ```.tfvars``` files can be excluded from version control (e.g., via .gitignore), they help reduce the risk of exposing sensitive data.

3. Reusability Across Environments
By creating different ```.tfvars``` files for various environments or use cases, you can reuse the same Terraform codebase. This allows you to easily deploy similar infrastructure in multiple environments just by swapping the variable values.

4. Better Collaboration
Each team member can maintain their own ```.tfvars``` file with settings specific to their workflow or environment. This prevents configuration conflicts and keeps shared code consistent.

## How to Use ```.tfvars``` Files
Define input variables in your Terraform configuration (e.g., in a variables.tf file).

Create one or more ```.tfvars``` files to hold the values for those variables (e.g., ```dev.tfvars```, ```prod.tfvars```).

Specify the ```.tfvars``` file when running Terraform commands using the -var-file flag:

```bash
terraform apply -var-file=dev.tfvars
```

**Summary**

- Using ```.tfvars``` files in Terraform allows you to:

- Keep your configurations clean and maintainable

- Enhance security by externalizing sensitive data

- Reuse the same code for multiple environments

- Collaborate effectively in team settings

This approach makes your Terraform projects more modular, secure, and scalable.

## Passing the variables, tfvars, modules in main.tf with multi region

main.tf

```bash
provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
}

resource "aws_instance" "Terraform" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  provider = aws.us-east-1
}

resource "aws_instance" "Terraform1" {
 ami = var.ami_value2
 instance_type = var.instance_type_value2
 provider = aws.us-east-2
}
```

variables.tf

```bash
variable "ami_value" {
  description = "value for ami"
}

variable "instance_type_value" {
  description = "value for instance_type"
}

variable "ami_value2" {
  description = "value for ami2"
}

variable "instance_type_value2" {
  description = "value for instance_type2"
}
```

terraform.tfvars

```bash
ami_value = "ami-0123456789d2d"
instance_type_value = "t2.micro"

ami_value2 = "ami-012345678993a"
instance_type_value2 = "t2.micro"
```





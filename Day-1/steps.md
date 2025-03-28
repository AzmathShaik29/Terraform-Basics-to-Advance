# Summary of Key Steps

Set up your Terraform project by creating a dedicated directory and a configuration file (typically named `main.tf`). In this file, define the AWS provider and specify the resources to be created. Here’s a simple example:

```hcl
provider "AWS" {
  region = "us-east-1"                      # Replace with your region
  
}

resource "aws_instance" "my_first_instance" {
  ami           = "ami-0c55b159cbfafe1f0"   # Replace with your AMI ID
  instance_type = "t2.micro"                # Replace with your instance type
  key_name      = "mykey"                   # Replace with your key name
  security_groups = ["my_first_sg"]         # Replace with your security group name
  tags = {                                  
    Name = "my_first_instance"
  }
}
```

## Initialize Terraform

In your terminal, navigate to the directory containing your Terraform configuration files and execute the following command:

```
terraform init
```

Run `terraform init` to initialize your Terraform project. This command sets up the backend, downloads required provider plugins, and prepares your environment for deployment.

## Plan the changes

```
terraform plan
```

`terraform plan` generates and displays an execution plan, showing what changes Terraform will make to the infrastructure based on the current state and configuration. It allows you to review the planned modifications before applying them, helping to prevent unintended changes.

## Apply the Configuration

Run the following command to create the AWS resources defined in your Terraform configuration:

```
terraform apply
```

Run `terraform apply` to provision the defined infrastructure. Review the execution plan and confirm the changes to deploy your resources.. type "yes" when prompted to apply it.

## Verify Resources

Once Terraform finishes provisioning, verify the created resources in the AWS Management Console or by running AWS CLI commands to confirm successful deployment.

## Destroy Resources

To remove the resources created by Terraform, run the following command:

```
terraform destroy
```

Use `terraform destroy` with caution, as it will permanently delete all resources defined in your Terraform configuration. Always review the plan before proceeding.
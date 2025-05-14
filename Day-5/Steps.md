## Method 1: Using Multiple .tfvars Files

- To manage different instance types for various environments, you can avoid editing terraform.tfvars directly.

- Instead, create separate variable definition files for each environment, such as:

	- ```stage.tfvars```

	- ```dev.tfvars```

	- ```prod.tfvars```

Use the appropriate file when running Terraform commands:
```bash
terraform apply -var-file=stage.tfvars
terraform apply -var-file=dev.tfvars
terraform apply -var-file=prod.tfvars
```
- This approach keeps environment configurations separate and easy to manage.


## Method 2: Using Terraform Workspaces
Terraform workspaces allow you to manage multiple environments without modifying the root module.

**Create a New Workspace**

```bash
terraform workspace new stage
terraform workspace new dev
terraform workspace new prod
```

**Switch Between Workspaces**
```bash
terraform workspace select stage
terraform workspace select dev
terraform workspace select prod
```

Check the Current Workspace
```bash
terraform workspace show
```

- When a workspace is created, Terraform automatically generates a directory called ```terraform.tfstate.d``` to store state files separately per workspace.

- You can still define common variables (e.g., AMI ID, instance type) in ```terraform.tfvars```, and values can be customized per workspace.

- Each environment will maintain its own isolated ```terraform.tfstate file```, preventing state conflicts.

## Method 3: Using Lookup Function in Module

- Instead of defining ```instance_type``` directly in ```terraform.tfvars```, you can use a lookup() function within your module configuration.

- This enables Terraform to dynamically select values (like ```instance_type```) based on the current environment.

- Example: the module can read from a map of environment-specific values and apply the correct configuration without hardcoding or manual changes.

**Benefits**

- Simplifies variable management

- Automatically picks the correct configuration based on the current workspace or environment

- Reduces human error by eliminating hardcoded values

**Conclusion**

Each method above is useful in different scenarios:

- Method 1: Great for simple setups or when you want full control over variable files.

- Method 2: Ideal for team environments and CI/CD workflows that need clean state separation.

- Method 3: Best for advanced automation and reducing manual input.

Choose the method—or a combination—that fits your infrastructure strategy and scaling needs.

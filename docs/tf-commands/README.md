# Terraform Commands

This file contains categorized lists of commonly used Terraform commands in this repository.

---

## Basic Commands

| Command                          | Description                                                      |
|-----------------------------------|------------------------------------------------------------------|
| `terraform init`                  | Initializes a Terraform working directory.                       |
| `terraform plan`                  | Shows the changes that will be applied to your infrastructure.   |
| `terraform apply`                 | Applies the planned changes to your infrastructure.              |
| `terraform apply --auto-approve`  | Applies the changes without prompting for approval.              |
| `terraform destroy`               | Destroys the managed infrastructure.                             |
| `terraform destroy -target <resource>`  |  Destroys a specific resource.                           |
| `terraform validate`              | Validates the configuration files in a directory.                |
| `terraform plan -replace=<resource>` | Creates a plan that replaces the specified resource.               |
| `terraform apply -replace=<resource>` | Creates a new resource and replaces the specified existing resource. |


---

## State Management Commands

| Command                          | Description                                                      |
|-----------------------------------|------------------------------------------------------------------|
| `terraform state list`            | Lists the resources in your Terraform state file.                |
| `terraform state show <resource-name>`            | Displays the details of a specific resource in your state file.  |
| `terraform refresh`               | Refreshes the state of managed resources.                        |

---

## Output & Visualization Commands

| Command                          | Description                                                      |
|-----------------------------------|------------------------------------------------------------------|
| `terraform output`                | Displays the output values of your Terraform configuration.      |
| `terraform graph`                 | Generates a dependency graph of your Terraform configuration.    |

---

## Formatting & Debugging Commands

| Command                          | Description                                                      |
|-----------------------------------|------------------------------------------------------------------|
| `terraform fmt`                   | Formats Terraform configuration files.                           |
| `terraform console`               | Opens a Terraform console for debugging and testing.             |

---

## Workspace Commands

| Command                          | Description                                                      |
|-----------------------------------|------------------------------------------------------------------|
| `terraform workspace`             | Manages Terraform workspaces.                                    |

---

## Advanced & Upgrade Commands

| Command                          | Description                                                      |
|-----------------------------------|------------------------------------------------------------------|
| `terraform init --upgrade`        | Upgrades provider plugins to the latest version.                 |
| `terraform login`                 | Authenticates your CLI with Terraform Cloud to enable remote operations. |
| `terraform logout`                | Removes saved credentials, logging you out from Terraform Cloud. |

---

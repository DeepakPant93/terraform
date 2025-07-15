# Terraform

This repository contains Terraform scripts demonstrating various examples using multiple cloud providers such as AWS, Azure, and GCP. Each example showcases different Terraform features and best practices for infrastructure as code.

---

## Terraform Basic Commands

| Command                | Description                                                      |
|------------------------|------------------------------------------------------------------|
| `terraform init`       | Initializes a Terraform working directory.                       |
| `terraform plan`       | Shows the changes that will be applied to your infrastructure.   |
| `terraform apply`      | Applies the planned changes to your infrastructure.              |
| `terraform destroy`    | Destroys the managed infrastructure.                             |
| `terraform validate`   | Validates the configuration files in a directory.                |
| `terraform apply --auto-approve`        | Applies the changes without user style.         |
| `terraform graph`      | Generates a dependency graph of your Terraform configuration.    |
| `terraform output`     | Displays the output values of your Terraform configuration.      |
| `terraform state list` | Lists the resources in your Terraform state file.                |
| `terraform state show` | Displays the details of a specific resource in your state file.  |
| `terraform fmt`        | Formats Terraform configuration files.                           |
| `terraform console`    | Opens a Terraform console for debugging and testing.             |
| `terraform workspace`  | Manages Terraform workspaces.                                    |
| `terraform refresh`    | Refreshes the state of managed resources.                        |
---

## Terraform in AWS

### AWS Provider Overview

The AWS provider allows Terraform to interact with AWS resources. It requires authentication using AWS credentials (access key and secret key) and supports a wide range of AWS services.

**Official Documentation:**  
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Provider on GitHub](https://github.com/hashicorp/terraform-provider-aws)

---

### How to Generate AWS Access Key and Secret Key

To use Terraform with AWS, you need an IAM user with programmatic access. Follow these steps:

1. Sign in to the AWS Management Console.
2. Go to **IAM** > **Users**.
3. Select or create a user, and attach necessary permissions.
4. Under **Security credentials**, click **Create access key**.
5. Save the **Access key ID** and **Secret access key** securely.

For a detailed walkthrough, refer to this video:  
https://youtu.be/4JYtAf4M88Y?si=L6dRq1JZ6VpXtzR5&t=936

---

### Configuring AWS Credentials

Terraform uses the AWS credentials to authenticate. Store your credentials in the `~/.aws/credentials` file:

```toml
[default]
aws_access_key_id = your-access-key
aws_secret_access_key = your-secret-key
region = ap-south-1
```

---

### Additional Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Documentation](https://www.terraform.io/docs)


### Local Setup

1. Install Terraform: https://developer.hashicorp.com/terraform/install
2. Configure AWS credentials: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication
3. Go to each folder and run `terraform init`


## Youtube Video References

1. https://www.youtube.com/watch?v=S9mohJI_R34
2. https://www.youtube.com/watch?v=4JYtAf4M88Y
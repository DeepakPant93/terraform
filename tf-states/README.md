# Terraform State Management

## Overview

Terraform uses a state file (`terraform.tfstate`) to keep track of the infrastructure resources it manages. This file is essential for mapping real-world resources to your configuration and for tracking metadata.

---

## Local and Remote State

By default, Terraform stores the state file locally in the current working directory. For team environments or enhanced reliability, you can store the state remotely using backends such as AWS S3.

### Example: Storing State in S3

```hcl
terraform {
  backend "s3" {
    bucket = "my-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
```

This configuration stores the state file in the specified S3 bucket.

---

## State File Details

- The `terraform.tfstate` file maintains the state of your infrastructure.
- When using local state, the file is created in your working directory.
- When using a remote backend (like S3), the state is stored remotely and can be shared across teams.

---

## State Management Tips

- If you manually delete infrastructure (e.g., an AWS EC2 instance) and run `terraform init` again, Terraform will recreate the infrastructure and update the state file.
- Terraform always tries to maintain the desired state as defined in your configuration.
- Use `terraform refresh` to update the state file to match the real infrastructure. For example, if an EC2 instance is deleted outside Terraform, running `terraform refresh` will remove its entry from the state file.

---
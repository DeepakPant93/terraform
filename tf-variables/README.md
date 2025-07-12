# Terraform Variables

## Introduction

Terraform variables are a powerful way to make your configurations more flexible and reusable. You can define, override, and manage them in multiple ways depending on your needs and environment.

---

## Defining Terraform Variables

Use the `variable` block to define variables in your Terraform configuration:

```hcl
variable "aws_region" {
  type    = string
  default = "ap-south-1"
}
```

You can provide values to these variables using a `terraform.tfvars` file. If both a default value and a value in `terraform.tfvars` are provided, the `.tfvars` file will take precedence.

> **Note:** If a `terraform.tfvars` file is present in the current working directory, Terraform will automatically load it.

---

## Environment-specific tfvars Files

You can create separate `.tfvars` files for different environments:

* `dev.tfvars`
* `stage.tfvars`
* `prod.tfvars`

To use a specific `.tfvars` file with Terraform:

```bash
terraform plan -var-file=dev.tfvars
```

Alternatively, you can use a JSON-formatted version:

```bash
terraform plan -var-file=dev.tfvars.json
```

---

## Ways to Provide Variable Values

Terraform supports four ways to provide values to variables:

1. **Variable default**
2. **terraform.tfvars file**
3. **Command line arguments**
4. **Environment variables**

---

### Command Line Arguments

You can override variable values directly in the command:

```bash
terraform plan -var="aws_region=ap-south-1"
```

---

### Environment Variables

Set the variable as an environment variable using the `TF_VAR_` prefix:

```bash
export TF_VAR_aws_region=ap-south-1
```

---

## Precedence of Variable Values

Terraform applies values in the following order (highest to lowest precedence):

1. **Command line arguments**
2. **Environment variables**
3. **terraform.tfvars file**
4. **Variable default**

> For example, if `aws_region` is defined in both the `.tfvars` file and the variable block default, the value in `.tfvars` will override the default.

---

## Reference

To learn more about Terraform variables, refer to the official documentation:

📘 [Terraform: Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

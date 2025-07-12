# Terraform Exam Notes

---

## User-Defined Functions

Terraform does not support user-defined functions. Instead, it relies on a set of built-in functions to perform operations and calculations within configurations. While this might limit flexibility, it ensures consistent and predictable execution behavior.

---

## Implicit Type Conversion

Terraform automatically converts numbers and boolean values to strings when required. This feature allows for flexible configuration and expression evaluation. For example, if a resource argument expects a string value, Terraform will implicitly convert a number or boolean value to a string before assigning it.

---

## Verified Providers

Verified providers are developed and maintained by third-party technology vendors as part of the HashiCorp Technology Partner Program. These providers undergo a validation process by HashiCorp to ensure quality and compatibility.  
- **Official Providers**: Maintained by HashiCorp.  
- **Verified Providers**: Maintained by third-party vendors.

---

## Provider Source Address

A provider’s source address is a global identifier that specifies its location. The format is:  
`[<HOSTNAME>/]<NAMESPACE>/<TYPE>`  

- **Hostname**: Defaults to `registry.terraform.io` (HashiCorp public registry) if not specified.  
- **Namespace**: Typically the publisher's name (e.g., `hashicorp`).  
- **Type**: The provider's short name (e.g., `aws`, `google`, `mysql`).  

Example:  
`hashicorp/aws` refers to the AWS provider from HashiCorp’s public registry. Its fully-qualified form is `registry.terraform.io/hashicorp/aws`.

---

## Commands

### `terraform validate -json`
Validates Terraform configuration files written in JSON format.

### `terraform init -from-module=MODULE-SOURCE`
Copies an existing Terraform module from the specified `MODULE-SOURCE` into your current working directory, transforming it into your root module.

---

## Debugging with TF_LOG

`TF_LOG` is an environment variable used to enable detailed logging output during Terraform commands such as `plan`, `apply`, `init`, and more. It is extremely useful for debugging unexpected behaviors and diagnosing issues.

---

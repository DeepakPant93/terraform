# Terraform Local Values

## 🛠 What are **`locals`**?

Terraform’s `locals` let you define **named expressions** within a module—similar to local variables in programming. This avoids repetition and improves maintainability.

---

## 🎯 Why use `locals`?

* **DRY (Don't Repeat Yourself):** Centralize common values, calculations, or expressions used across multiple resources.
* **Clarity & Organization:** Group transformations or computed values in one place.
* **Maintainability:** Update a value once and have it reflected wherever it’s used.&#x20;

They are best for values that appear multiple times and may change, although overuse can obscure what's actually being used.&#x20;

---

## 📦 How to use `locals`

### 1. **Declare a `locals` block**

```hcl
locals {
  service_name = "forum"
  owner        = "Community Team"
}
```

### 2. **Create computed values**

You can reference variables, resources, or other locals:

```hcl
locals {
  instance_ids = concat(aws_instance.blue.*.id, aws_instance.green.*.id)
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}
```

These expressions can produce arrays, maps, nested values, etc.

### 3. **Reference via `local.<name>`**

Use the defined values elsewhere in your config:

```hcl
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  tags          = local.common_tags
}
```

Locals are **module-scoped**, so they are not visible outside the module where they're declared.

### 4. **Support for ephemeral locals (Terraform v1.10+)**

If your local references an **ephemeral** value, the local becomes ephemeral too. Useful for temporary secrets or values you don’t want persisted.

---

## ✅ Summary

| Aspect   | Details                                                                   |
| -------- | ------------------------------------------------------------------------- |
| **What** | Named expressions within a module; like temporary variables               |
| **Why**  | Avoid repetition, centralize logic, boost readability and maintainability |
| **How**  | Define in `locals {}`, refer via `local.<name>`, compute as needed        |

---

### References

- [Local Values - Terraform Documentation](https://developer.hashicorp.com/terraform/language/values/locals)

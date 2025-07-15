# Terraform Module

## ✅ 1. What Are Terraform Modules?

* A **module** is a collection of Terraform files (`.tf`) grouped in a directory. Even your root configuration is a module.
* Modules encapsulate infrastructure components — VPCs, EC2s, databases — into reusable, logical units.

---

## 📦 2. Using Pre-Built Modules

Pre-built modules save time and bring reliability:

* **Find** modules on the Terraform Registry, GitHub, cloud marketplaces.
* **Consume** with a `module` block:

  ```hcl
  module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "3.19.0"
    name    = "my-vpc"
    cidr    = "10.0.0.0/16"
    ...
  }
  ```
* Use **version constraints** to lock dependencies and manage upgrades.
* Examples and outputs help integration.

---

## 🔧 3. Creating a Custom Module

1. **Structure your module** in its own directory:

   ```
   my-module/
     main.tf
     variables.tf
     outputs.tf
     README.md
     examples/
   ```

2. **Define variables** (`variables.tf`) and **outputs** (`outputs.tf`) to configure and expose internal values.

3. **Build resources** in `main.tf`, using input variables.

4. **Document usage & examples** in README.md and the examples folder.

5. **Optionally create submodules** for complex logic (e.g., `modules/network/`, `modules/compute/`).

---

## 🛠️ 4. Module Best Practices

* **One responsibility per module** — keep modules small and focused.
* **Use clear structure**: `main.tf`, `variables.tf`, `outputs.tf`, `README.md`, `examples/`.
* **Minimize variables** — default or optional for static configurations.
* **Ensure backward compatibility** — new variables should have defaults, removing variables should be avoided.
* **Version control your module** in Git, tag releases semantically (e.g., v1.2.3).
* **Use `terraform-docs`** or similar tools to auto-generate docs.
* **Test thoroughly** — use examples and CI pipelines to maintain module integrity.
* **Limit nested modules** to logical subcomponents only.

---

## 🚀 5. Publishing to Terraform Registry

1. **Ensure GitHub repo** is public and named using format: `terraform-<PROVIDER>-<NAME>` (e.g., `terraform-aws-vpc`).
2. **Push a semantic version tag** (v1.0.0).
3. **Connect repo to Terraform Registry** via GitHub/GitHub App; click "Publish Module."
4. New tags automatically generate versions in the registry.
5. **Maintain and version modules** properly; users can lock to versions with `version` attribute.
6. For private needs, use Terraform Enterprise/HCP private registry.
5. **Maintain and version modules** properly; users can lock to versions with `version` attribute .
6. For private needs, use Terraform Enterprise/HCP private registry ([HashiCorp Developer][8]).

## References
- https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
- https://developer.hashicorp.com/terraform/language/modules
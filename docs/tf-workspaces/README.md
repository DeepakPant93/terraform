# Terraform Workspaces

## 🌐 1. What Problem Do Workspaces Solve?

Terraform **workspaces** allow you to manage **multiple, isolated state files** using a single configuration:

* They provide separate state instances so you can deploy the same infrastructure (e.g., dev, staging, prod) without duplicating code or config directories.
* Each workspace has its own state snapshot stored in your backend (S3, Consul, Local, etc.), ensuring one workspace doesn’t affect another.

---

## 🔧 2. How It Works

* By default, Terraform has a single workspace named **`default`**.
* You can **create (`terraform workspace new NAME`)**, **list**, **select (`terraform workspace select NAME`)**, and **delete (`delete NAME`)** workspaces.
* The **current workspace** is referenced in configs via `${terraform.workspace}`, useful for tagging or conditional logic.

---

## 📦 3. Deep Dive: State Isolation

* In **remote backends** (e.g., S3), each workspace appends its name to the path of the state file—for instance:

  ```
  my-bucket/path/to/terraform.tfstate  ← default workspace
  my-bucket/path/to/env:dev/terraform.tfstate  ← dev workspace
  ```

* With **local backend**, workspace states are stored in `.terraform/terraform.tfstate.d/WORKSPACE/terraform.tfstate`.

---

## 📚 4. Example Commands

```bash
terraform workspace list          # Shows all workspaces, * marks current
terraform workspace new staging  # Create and switch
terraform workspace select dev   # Switch workspace
terraform workspace show         # Display current workspace
terraform workspace delete test  # Delete a workspace (must be empty)
```

---

## 📋 5. Best Practices

* Use `${terraform.workspace}` to parameterize names, tags, or resource counts.
* Always run `terraform workspace show` in scripts to ensure you're using the correct workspace.
* Only use workspaces for **simple variations** of the same infrastructure; for differing infra, prefer separate folders or modules.

---

## 🏗️ 6. Sample Config Snippet

```hcl
resource "aws_s3_bucket" "example" {
  bucket = "${terraform.workspace}-mybucket"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_instance" "app" {
  count = terraform.workspace == "default" ? 3 : 1
  # ...
}
```

This ensures resource naming, tagging, and scaling behavior adjust based on workspace.
# Terraform Cloud Features & Workflows

## 1. What is Terraform Cloud?

Terraform Cloud is a managed SaaS platform by HashiCorp that builds upon the Terraform CLI. It offers collaboration-friendly features like remote state storage, workspace execution, VCS integration, policy enforcement, and role-based access control.

---

## 2. Why Use Terraform Cloud?

* **Collaboration & Governance**: Enables team access controls, RBAC, and audit trails.
* **Remote State Management**: Secure and versioned state with locking to avoid conflicts.
* **Policy Enforcement**: Uses Sentinel or OPA to enforce compliance and security guardrails.
* **VCS Integration**: Supports GitOps flows via GitHub, GitLab, etc.
* **Automation**: Provides cost estimation, drift detection, policy checks, and run-task integrations.

---

## 3. Benefits

| Benefit                           | Description                                                                    |
| --------------------------------- | ------------------------------------------------------------------------------ |
| **Secure State storage**          | Centralized remote backend with locking to prevent corruption                  |
| **Team collaboration**            | Workspaces support RBAC and allow concurrent parallel operations               |
| **Policy as Code (Sentinel/OPA)** | Enforce best practices, governance, and cost controls across runs              |
| **Cost Estimation**               | Built-in cost-preview before apply                                             |
| **VCS / CI Integration**          | Automated GitOps workflow with GitHub, GitLab, Bitbucket, etc.                 |
| **Private Module Registry**       | Hosts and maintains org-wide reusable Terraform modules                        |
| **Drift Detection**               | Periodic checks for real-world config drift                                    |

---

## 4. Core Concepts

* **Workspaces**: Logical environments with separate state and runs
* **Projects**: Groups of related workspaces for organizational convenience
* **Runs**: Lifecycle of `plan`, `policy check`, and `apply` processes
* **Variable & Policy Sets**: Reusable sets applied across workspaces
* **Run Tasks & Agents**: Integrate with third-party tools; use self-hosted runners for private networks

---

## 5. Creating Projects & Workspaces

### ✏️ CLI-driven Workflow

In your `terraform` block include:

```hcl
terraform {
  cloud {
    organization = "org-name"

    workspaces {
      name = "workspace-name"
    }
  }
}
```

Then:

```bash
terraform login
terraform init       # creates workspace automatically
terraform plan/apply # remote execution via Terraform Cloud UI
```

This initializes a CLI-based workspace in the default project.

### 🖥️ UI or VCS-driven Workflow

1. Go to Terraform Cloud → **Projects & Workspaces** → **New Workspace**
2. Choose workflow (VCS-driven)
3. Connect GitHub and select repository & branch
4. Name workspace and configure advanced settings

Once created, Terraform Cloud detects variables needing values and prompts you to set them in the UI.

---

## 6. Integrating with GitHub

1. Create GitHub repo with Terraform code (`main.tf`, `variables.tf`, etc.)
2. In Terraform Cloud workspace, choose **VCS workflow** and connect GitHub
3. Authorize Terraform Cloud in GitHub
4. Configure working directory, branch, auto-run settings
5. Push changes → Terraform Cloud auto-triggers `plan` and displays run results
6. Review and apply via UI or merge pull request

You can also set up GitHub Actions or API-driven workspaces for dynamic workspace creation on PRs.

---

## 7. AWS Integration (Environment Variables)

To allow AWS provisioning via Terraform Cloud, set the following **environment variables** in the workspace or a global Variable Set:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

Mark sensitive values as *sensitive* in the UI. For safety, grant minimal IAM permissions.

---

## ▶️ Example: CLI-driven Setup with AWS

```hcl
# terraform.tf
terraform {
  cloud {
    organization = "my-org"
    workspaces {
      name = "aws-prod-network"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
```

**Then run:**

```bash
terraform login
terraform init    # creates workspace
terraform plan    # executes remotely
```

In Terraform Cloud UI → **Variables** → set:

```
AWS_ACCESS_KEY_ID: <your key>
AWS_SECRET_ACCESS_KEY: <your secret>  # Sensitive
```

---

## 📦 Sample GitHub Project

You can find a sample Terraform Cloud + AWS Nginx project here:  
[https://github.com/DeepakPant93/tf-cloud-aws-nginx](https://github.com/DeepakPant93/tf-cloud-aws-nginx)

---


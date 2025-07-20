# 🚀 Terraform Scenario-Based Questions & Answers

A set of common real-world DevOps scenarios involving Terraform, along with detailed answers.

---

## 🛠️ Scenario 1: Importing Manually Created AWS Resources into Terraform

**❓ Question:**
A DevOps engineer manually created infrastructure on AWS. How can you now manage these resources using Terraform?

**✅ Answer:**
To manage manually created resources with Terraform:

1. **Write the Terraform configuration** for each resource (e.g., instance type, AMI, etc.).
2. Run the `terraform import` command:

   ```bash
   terraform import <resource_type>.<resource_name> <unique_ID>
   ```
3. Repeat this process for each manually created resource you want Terraform to manage.

---

## 🌐 Scenario 2: Reusing the Same Terraform Code Across Environments (Dev, Stage, Prod)

**❓ Question:**
How can you use the same Terraform code for multiple environments?

**✅ Answer:**
You can achieve this through:

1. **Terraform Modules**:

   * Encapsulate reusable infrastructure logic.
   * Use different input variables for Dev, Stage, and Prod environments.

2. **Terraform Workspaces**:

   * Maintain **separate state files** for each environment.
   * Enables parallel environment management with the same config.

---

## 🧩 Scenario 3: State File Deleted by Mistake

**❓ Question:**
What steps should be taken if a junior engineer accidentally deletes the Terraform state file?

**✅ Answer:**

1. **Recover from Backup**:

   * Restore the state file from backup if available.

2. **Manual Reconstruction**:

   * Recreate the state file using `terraform import` for all existing resources.

3. **Review & Validate**:

   * Confirm everything is correct by reviewing and testing the infrastructure.

---

## ☁️ Scenario 4: Managing Multi-Cloud (AWS & Azure) with Terraform

**❓ Question:**
How do you manage resources in AWS and Azure with a single Terraform setup?

**✅ Answer:**

1. **Define Multiple Providers**:

   ```hcl
   provider "aws" {
     region = "us-east-1"
   }

   provider "azurerm" {
     features = {}
   }
   ```

2. **Write Resource Blocks**:

   * Define AWS and Azure resources under their respective providers.

---

## 🖥️ Scenario 5: Running Bash Scripts After Resource Creation

**❓ Question:**
How can you execute bash scripts after resources are created with Terraform?

**✅ Answer:**
Use **Terraform Provisioners**:

* **`local-exec`**: Executes scripts/commands on your local machine.
* **`remote-exec`**: Executes scripts/commands inside the provisioned server (e.g., EC2 instance).

  > When using `remote-exec`, you must also define a `connection` block to SSH into the remote machine.

---

## 🔁 Scenario 6: Performing Blue-Green Deployments with Terraform

**❓ Question:**
How do you implement high availability using blue-green deployment with Terraform?

**✅ Answer:**

1. Create the new **green** environment alongside the existing **blue** environment.
2. Validate the green environment is functioning correctly.
3. Switch production traffic (via load balancer or DNS) from blue to green.

---

## 🔗 Scenario 7: Defining Resource Dependencies (e.g., EC2 before RDS)

**❓ Question:**
How do you ensure one resource is created before another?

**✅ Answer:**
Use the `depends_on` meta-argument:

```hcl
resource "aws_db_instance" "rds" {
  depends_on = [aws_instance.web]
  ...
}
```

This ensures `aws_instance.web` is created before `aws_db_instance.rds`.

---

## 🧹 Scenario 8: Destroying a Single Resource

**❓ Question:**
How can you delete just one resource out of many using Terraform?

**✅ Answer:**
Use the `-target` flag with the `terraform destroy` command:

```bash
terraform destroy -target=aws_instance.target_name
```

This will destroy only the specified resource, not the entire infrastructure.

---

## 🧹 Scenario 9: Does Terraform Automatically Check Resource Health?

**❓ Question:**  
Does Terraform automatically monitor and heal resources if they become unhealthy or are deleted?

**✅ Answer:**  
No, Terraform does **not** automatically check or monitor the health of resources after they are created. Terraform is a declarative Infrastructure as Code (IaC) tool that provisions and manages infrastructure based on your configuration files. Once resources are created, Terraform assumes they remain in the desired state.

- **No Continuous Monitoring:**  
  Unlike tools such as Kubernetes, Terraform does not continuously monitor or self-heal resources. It does not detect if a resource is deleted or becomes unhealthy unless you run `terraform plan` or `terraform apply` again.

- **Reconciliation:**  
  If a resource is changed or deleted outside of Terraform, you must manually run `terraform plan` and `terraform apply` to detect and reconcile the drift.

- **Example:**  
  If Terraform creates an AWS EC2 instance and that instance is terminated manually or by AWS, Terraform will not recreate it automatically. You need to re-run Terraform to bring the infrastructure back to the desired state.
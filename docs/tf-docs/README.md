# Terraform-Docs Tool

## What is Terraform-Docs?

**terraform-docs** is an open-source, cross-platform command-line tool that automates the generation of documentation for Terraform modules. By scanning Terraform configuration files, it extracts information about inputs (variables), outputs, providers, resources, and other components, and formats this information into structured documentation. It supports multiple output formats, with Markdown tables being the most popular for generating `README.md` files for GitHub or other repositories.

The tool helps developers and teams by:
- **Automating Documentation**: Eliminates the need for manual updates, saving time and reducing errors.
- **Ensuring Consistency**: Produces standardized documentation across projects.
- **Improving Maintainability**: Keeps documentation in sync with code changes.
- **Supporting CI/CD Integration**: Can be integrated into workflows like GitHub Actions or pre-commit hooks for automatic updates.

## How to Use Terraform-Docs

To use **terraform-docs**, you need to install it, configure it (optionally), and run it against your Terraform module directory. Below are the steps and examples for using the tool.

### Installation

You can install **terraform-docs** using various methods depending on your platform. Here are a few common approaches:

- **Using Homebrew (macOS/Linux)**:
  ```bash
  brew install terraform-docs
  ```
  [](https://formulae.brew.sh/formula/terraform-docs)

- **Using Curl (Linux/macOS)**:
  ```bash
  curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.20.0/terraform-docs-v0.20.0-$(uname)-amd64.tar.gz
  tar -xzf terraform-docs.tar.gz
  chmod +x terraform-docs
  mv terraform-docs /usr/local/bin/terraform-docs
  ```
  [](https://github.com/terraform-docs/terraform-docs)

- **Using Go**:
  ```bash
  go install github.com/terraform-docs/terraform-docs@v0.20.0
  ```
  [](https://github.com/terraform-docs/terraform-docs)

- **Windows**: Use a package manager like Chocolatey or Scoop, or download the binary from the [releases page](https://github.com/terraform-docs/terraform-docs/releases).

### Basic Usage

To generate documentation, run the `terraform-docs` command in your Terraform module directory. The tool scans files like `main.tf`, `variables.tf`, and `outputs.tf` to produce output.

#### Example 1: Generating Markdown Table

Assume you have a simple Terraform module with the following files:

**variables.tf**:
```hcl
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
```

**outputs.tf**:
```hcl
output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.example.id
}
```

**main.tf**:
```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
}
```

Run the following command to generate a Markdown table:
```bash
terraform-docs markdown table . --output-file README.md
```

This command generates a `README.md` file with content like:
```markdown
## Requirements
| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 3.0 |

## Providers
| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instance_type | Type of EC2 instance | `string` | `"t2.micro"` | no |

## Outputs
| Name | Description |
|------|-------------|
| instance_id | ID of the created EC2 instance |
```

#### Example 2: Using a Configuration File

You can customize the output using a `.terraform-docs.yml` configuration file in the root of your project. This allows you to define sections, formatting, and additional content.

**.terraform-docs.yml**:
```yaml
formatter: "markdown"
output:
  file: "README.md"
  mode: inject
sections:
  show:
    - header
    - providers
    - inputs
    - outputs
content: |
  # My Terraform Module
  This module provisions an EC2 instance.
  <!-- BEGIN_TF_DOCS -->
  {{ .Content }}
  <!-- END_TF_DOCS -->
```

Run the command:
```bash
terraform-docs .
```

This injects the generated documentation into `README.md` between the `<!-- BEGIN_TF_DOCS -->` and `<!-- END_TF_DOCS -->` markers, preserving custom content outside these tags. The output might look like:
```markdown
# My Terraform Module
This module provisions an EC2 instance.
<!-- BEGIN_TF_DOCS -->
## Providers
| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instance_type | Type of EC2 instance | `string` | `"t2.micro"` | no |

## Outputs
| Name | Description |
|------|-------------|
| instance_id | ID of the created EC2 instance |
<!-- END_TF_DOCS -->
```

#### Example 3: Integration with GitHub Actions

You can automate documentation updates using GitHub Actions. Create a workflow file (e.g., `.github/workflows/terraform-docs.yml`):

```yaml
name: Generate Terraform Docs
on:
  pull_request:
jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          ref: ${{ github.event.pull_request.head.ref }}
      - name: Render Terraform Docs
        uses: terraform-docs/gh-actions@main
        with:
          working-dir: .
          output-file: README.md
          output-method: inject
          git-push: "true"
```

This workflow runs on pull requests, generates documentation, and pushes updates to the `README.md` file in the pull request branch.[](https://github.com/terraform-docs/terraform-docs)

### Best Practices

- **Add Descriptions**: Ensure variables, outputs, and resources include `description` attributes in your Terraform code for meaningful documentation.
- **Use Configuration Files**: Use `.terraform-docs.yml` for consistent formatting across projects.
- **Automate with CI/CD**: Integrate with GitHub Actions, Azure DevOps, or pre-commit hooks to keep documentation up-to-date automatically.
- **Choose Markdown for READMEs**: The Markdown table format is ideal for GitHub repositories.
- **Test Locally**: Run `terraform-docs` locally to verify output before committing.

## Notes

- **Limitations**: `terraform-docs` works best for Terraform modules, not necessarily for Terragrunt configurations, as it primarily parses HCL-based Terraform files.[](https://www.reddit.com/r/Terraform/comments/1ay57ub/is_there_anything_like_terraformdocs_for/)
- **Supported Formats**: Includes Markdown, JSON, YAML, XML, and more. Check the [official documentation](https://terraform-docs.io/) for all formats.
- **Pre-Commit Hooks**: Use with pre-commit to update documentation automatically on commits. Example configuration:
  ```yaml
  repos:
    - repo: https://github.com/terraform-docs/terraform-docs
      rev: v0.20.0
      hooks:
        - id: terraform-docs-go
          args: ["markdown", "table", "--output-file", "README.md", "."]
  ```
  [](https://github.com/terraform-docs/terraform-docs)

- **Official Repository**: Find more details, installation instructions, and examples at [github.com/terraform-docs/terraform-docs](https://github.com/terraform-docs/terraform-docs).
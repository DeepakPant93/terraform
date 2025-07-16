# Terraform Data Source

## What is a Data Source?

In Terraform, a **data source** is used to fetch and reference information from external sources or existing infrastructure resources without managing them. Data blocks allow you to query data from providers (e.g., AWS, Azure, GCP) or other Terraform configurations and use that data in your configuration. Unlike resource blocks, data blocks do not create or modify resources; they only retrieve read-only data.

Data blocks are particularly useful for:

- Referencing existing resources not managed by the current Terraform configuration.
- Fetching dynamic information, such as AMIs, IP addresses, or database details.
- Sharing data between different Terraform modules or configurations.

## How to Use Data Blocks

To use a data block, you define it in your Terraform configuration with the `data` keyword, specify the provider-specific data source, and provide any required attributes. Once defined, the data can be referenced in your Terraform configuration using the `data.<data_type>.<name>` syntax.

### Syntax

```hcl
data "<data_type>" "<name>" {
  # Attributes specific to the data source
}
```

- `<data_type>`: The type of data source (e.g., `aws_ami`, `azurerm_resource_group`).
- `<name>`: A user-defined name for the data block, used to reference it later.
- Attributes: Configuration specific to the data source, such as filters or IDs.

### Sample Code

Below are examples demonstrating how to use data blocks with different providers.

#### Example 1: Fetching an AWS AMI

This example retrieves the latest Amazon Linux 2 AMI from AWS.

```hcl
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
}
```

In this example:

- The `data "aws_ami"` block queries AWS for the latest AMI matching the specified filter.
- The `most_recent = true` ensures the latest AMI is selected.
- The AMI ID is referenced in the `aws_instance` resource using `data.aws_ami.latest_amazon_linux.id`.

#### Example 2: Using a Data Block to Fetch a VPC

This example retrieves an existing AWS VPC by its ID.

```hcl
data "aws_vpc" "existing_vpc" {
  id = "vpc-1234567890abcdef0"
}

resource "aws_subnet" "example" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = "10.0.1.0/24"
}
```

In this case, the `data "aws_vpc"` block fetches the details of an existing VPC, and its ID is used to create a new subnet within that VPC.

## Best Practices

- **Use Specific Filters**: When querying data sources, use precise filters to avoid ambiguity and ensure the correct resource is retrieved.
- **Minimize Dependencies**: Avoid overusing data blocks for resources that could be managed directly in Terraform to maintain clarity.
- **Reference Safely**: Ensure the referenced data exists and is accessible to avoid errors during Terraform execution.
- **Provider Configuration**: Ensure the provider is properly configured for the data source, including credentials and region settings.

## Notes

- Data sources are read-only and cannot modify resources.
- Data sources depend on the provider's API, so ensure the provider is correctly configured in your Terraform configuration.
- Some data sources may require additional permissions to access the requested information.

## References

- https://developer.hashicorp.com/terraform/language/data-sources
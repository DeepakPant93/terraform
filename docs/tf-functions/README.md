# Terraform Built-In Functions Documentation

## Overview

Terraform provides a rich set of built-in functions that you can use within your configuration files to transform and manipulate data. These functions allow you to perform operations such as string manipulation, mathematical calculations, data type conversions, and more. They are invoked using the syntax `function_name(arguments)` and can be used in expressions to compute values dynamically.

## Categories of Built-In Functions

Terraform's built-in functions are grouped into several categories based on their purpose. Below are the main categories with examples of commonly used functions.

### 1. String Functions

String functions manipulate and transform string data.

- **`format(spec, values...)`**: Formats a string according to a specification.
- **`join(separator, list)`**: Combines a list of strings into a single string with a specified separator.
- **`lower(string)`**: Converts a string to lowercase.

**Example**:
```hcl
variable "name" {
  default = "World"
}

locals {
  formatted = format("Hello, %s!", var.name)
  joined    = join(",", ["apple", "banana", "orange"])
  lowercase = lower("Terraform")
}

output "string_examples" {
  value = {
    formatted = local.formatted
    joined    = local.joined
    lowercase = local.lowercase
  }
}
```
*Output*: 
```json
{
  "formatted": "Hello, World!",
  "joined": "apple,banana,orange",
  "lowercase": "terraform"
}
```

### 2. Numeric Functions

Numeric functions perform mathematical operations or manipulate numbers.

- **`max(numbers...)`**: Returns the largest number from a list.
- **`min(numbers...)`**: Returns the smallest number from a list.
- **`ceil(number)`**: Rounds a number up to the nearest integer.

**Example**:
```hcl
locals {
  maximum = max(10, 20, 15)
  minimum = min(10, 20, 15)
  ceiling = ceil(4.2)
}

output "numeric_examples" {
  value = {
    maximum = local.maximum
    minimum = local.minimum
    ceiling = local.ceiling
  }
}
```
*Output*:
```json
{
  "maximum": 20,
  "minimum": 10,
  "ceiling": 5
}
```

### 3. Collection Functions

Collection functions operate on lists, maps, and sets.

- **`length(collection)`**: Returns the length of a list, map, or string.
- **`element(list, index)`**: Retrieves an element from a list by index.
- **`lookup(map, key, default)`**: Retrieves a value from a map, returning a default if the key is not found.

**Example**:
```hcl
locals {
  fruits       = ["apple", "banana", "orange"]
  fruit_length = length(local.fruits)
  second_fruit = element(local.fruits, 1)
  config       = { "env" = "prod" }
  env_value    = lookup(local.config, "env", "dev")
}

output "collection_examples" {
  value = {
    fruit_length = local.fruit_length
    second_fruit = local.second_fruit
    env_value    = local.env_value
  }
}
```
*Output*:
```json
{
  "fruit_length": 3,
  "second_fruit": "banana",
  "env_value": "prod"
}
```

### 4. File System Functions

File system functions interact with local files.

- **`file(path)`**: Reads the contents of a file as a string.
- **`templatefile(path, vars)`**: Renders a template file with provided variables.

**Example**:
```hcl
locals {
  content = file("config.txt")
  template = templatefile("template.tmpl", { name = "Terraform" })
}

output "file_examples" {
  value = {
    content = local.content
    template = local.template
  }
}
```
*Assumptions*:
- `config.txt` contains: `Hello, Terraform!`
- `template.tmpl` contains: `Welcome, ${name}!`

*Output*:
```json
{
  "content": "Hello, Terraform!",
  "template": "Welcome, Terraform!"
}
```

### 5. Type Conversion Functions

Type conversion functions convert values between different data types.

- **`tostring(value)`**: Converts a value to a string.
- **`tonumber(value)`**: Converts a value to a number.
- **`tolist(value)`**: Converts a value to a list.

**Example**:
```hcl
locals {
  str_num   = tostring(42)
  num_val   = tonumber("123")
  list_vals = tolist(["a", "b", "c"])
}

output "type_conversion_examples" {
  value = {
    str_num   = local.str_num
    num_val   = local.num_val
    list_vals = local.list_vals
  }
}
```
*Output*:
```json
{
  "str_num": "42",
  "num_val": 123,
  "list_vals": ["a", "b", "c"]
}
```

### 6. Conditional Functions

Conditional functions evaluate conditions to return values.

- **`coalesce(values...)`**: Returns the first non-null value from a list.
- **`coalescelist(lists...)`**: Returns the first non-empty list.

**Example**:
```hcl
locals {
  first_non_null = coalesce(null, "", "valid", "another")
  first_list     = coalescelist([], [], ["a", "b"], ["c", "d"])
}

output "conditional_examples" {
  value = {
    first_non_null = local.first_non_null
    first_list     = local.first_list
  }
}
```
*Output*:
```json
{
  "first_non_null": "valid",
  "first_list": ["a", "b"]
}
```

## Best Practices

- **Use Functions Sparingly**: Combine functions only when necessary to keep configurations readable.
- **Validate Inputs**: Ensure function arguments are valid to avoid runtime errors (e.g., valid indices for `element`).
- **Leverage Documentation**: Refer to the [official Terraform documentation](https://developer.hashicorp.com/terraform/language/functions) for a complete list of functions and their arguments.
- **Test Configurations**: Use `terraform console` to test function behavior interactively.

## Notes

- Terraform functions are evaluated during the `terraform plan` and `terraform apply` phases.
- Some functions may require specific provider configurations or access to external resources (e.g., `file` needs access to the local filesystem).
- Functions cannot be used in all contexts; for example, they are not allowed in `provider` or `variable` block attributes.
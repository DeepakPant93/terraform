variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"


}


variable "env_name" {
  description = "The environment name for tagging resources"
  type        = string
  #   default     = "dev"

  validation {
    condition     = contains(["dev", "stage", "prod"], var.env_name)
    error_message = "Environment name must not be empty."
  }

}

variable "instance_type" {
  description = "The type of AWS instance to create"
  type        = string
  default     = "t2.nano"

  validation {
    condition     = contains(["t2.micro", "t2.nano"], var.instance_type)
    error_message = "Instance type must be a valid AWS instance type. Supported values are 't2.micro' and 't2.nano'."
  }
}

variable "ami" {
  description = "The AMI ID to use for the AWS instance"
  type        = string
  default     = "ami-0f918f7e67a3323f0" # Example AMI, replace with a valid one for your region

}

variable "tags" {
  description = "Tags to apply to the AWS resources"
  type        = map(string)
  default = {
    Name = "MyInstance"
  }
}

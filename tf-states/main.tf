terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
        }
    }

}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my_new_instance" {
    ami           = "unknown" # Example AMI ID, replace with a valid one
    instance_type = "unknown" # This will be set dynamically

  
}
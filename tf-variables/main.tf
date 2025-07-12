terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

}

resource "aws_instance" "my_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name        = "MyInstance"
    Environment = var.env_name
  }

}

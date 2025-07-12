terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"

}

provider "aws" {
  alias  = "singapore"
  region = "ap-southeast-1"

}

resource "aws_instance" "my_instance_singapore" {
  provider      = aws.singapore
  count         = var.is_test_env ? 0 : 2
  ami           = "ami-02c7683e4ca3ebf58"
  instance_type = "t2.nano"

  tags = {
    Name = "MyInstance_dev_${count.index}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "my_instance_mumbai" {
  provider      = aws.mumbai
  count         = var.is_test_env ? 1 : 3
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.nano"

  tags = {
    Name = "MyInstance_dev_${count.index}"
  }

    lifecycle {
        ignore_changes = [
        tags["Name"],
        ]
        prevent_destroy = true
    }
}
terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
        }
    }
}

provider "aws" {
    region = local.region
}

resource "aws_instance" "my_instance" {
    ami           = local.ami_ubuntu_mumbai
    instance_type = local.instance_type

    count = local.instance_count

  
}
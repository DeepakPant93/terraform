terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0f918f7e67a3323f0" # Example AMI ID, replace with a valid one
  instance_type = "t2.micro"

  tags = {
    Name = "My EC2 Instance"
  }
  
}
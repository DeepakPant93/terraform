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

resource "aws_instance" "nginx_server" {
  ami           = "ami-0f918f7e67a3323f0" # Example AMI ID, replace with a valid one
  instance_type = "t2.micro"

  tags = {
    Name = "NginxServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
}

resource "aws_security_group" "nginx_sg" {
  name        = "nginx_security_group"
  description = "Allow all inbound and outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}
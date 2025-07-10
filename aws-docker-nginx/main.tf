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

resource "aws_instance" "docker_nginx_server" {

  depends_on = [aws_security_group.docker_nginx_sg]

  ami           = "ami-0f918f7e67a3323f0" # Example AMI ID, replace with a valid one
  instance_type = "t2.micro"

  tags = {
    Name = "DockerNginxServer"
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install -y docker.io
                sudo systemctl start docker
                sudo systemctl enable docker
                sudo docker run -d -p 80:80 nginx
                EOF

  vpc_security_group_ids = [aws_security_group.docker_nginx_sg.id]

}
resource "aws_security_group" "docker_nginx_sg" {
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
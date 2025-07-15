resource "aws_instance" "my_new_instance" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"

  tags = {
    Name = "MyNewInstance"
  }
}
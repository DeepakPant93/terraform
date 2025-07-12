output "aws_instances_singapore" {
  value = aws_instance.my_instance_singapore[*].id


}

output "aws_instances_mumbai" {
  value = aws_instance.my_instance_mumbai[*].id

}
output "public_ip" {
  value = aws_instance.docker_nginx_server.public_ip

}
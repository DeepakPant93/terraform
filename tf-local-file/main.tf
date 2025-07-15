resource "local_file" "my_file" {
  content  = "This is an example of a local file resource."
  filename = "${path.module}/example.txt"
  file_permission = "0644"
  directory_permission = "0755"
  
}
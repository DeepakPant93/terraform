resource "aws_dynamodb_table" "tf_remote_backend" {
  name         = "tf-remote-backend-state-table"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "tf-remote-backend"
    Environment = "Terraform"
  }

}
resource "aws_s3_bucket" "tf_remote_backend" {
  bucket = "tf-remote-backend-bucket-656288353549"

  tags = {
    Name        = "tf-remote-backend"
    Environment = "Terraform"
  }

}
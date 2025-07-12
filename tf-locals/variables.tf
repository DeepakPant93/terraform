locals {
  resource_prefix = "tf-example"
  resource_abbr = "${local.resource_prefix}-${var.env}"
  region = "ap-south-1"
  instance_type = "t2.nano"
  ami_ubuntu_mumbai = "ami-0f918f7e67a3323f0"
  instance_count = var.env == "dev" ? 1 : var.env == "test" ? 2 : var.env == "prod" ? 3 : 1
}

variable "env" {
  type = string
  description = "The environment for which the resources are being created (e.g., dev, prod, test)"
  default = "dev"
}
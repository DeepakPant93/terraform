terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "tf-remote-backend-bucket-656288353549"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-remote-backend-state-table"
  }
}

provider "aws" {
  region = "ap-south-1"

}

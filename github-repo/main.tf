terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  # Configuration options

}

resource "github_repository" "my_repo" {
  name        = "tf_example"
  description = "My awesome codebase"

  visibility = "public"

}
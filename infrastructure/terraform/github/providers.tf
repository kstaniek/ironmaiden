terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.13.0"
    }
  }
}

provider "github" {
  token = module.onepassword_item_github.fields.pat_terraform
}

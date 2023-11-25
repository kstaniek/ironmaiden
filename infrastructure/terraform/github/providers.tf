terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
  }
}

provider "github" {
  token = module.onepassword_item_github.fields.pat_terraform
}

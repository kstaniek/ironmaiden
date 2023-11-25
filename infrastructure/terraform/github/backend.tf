terraform {
  cloud {
    organization = "kstaniek"
    workspaces {
      name = "home-github-provisioner"
    }
  }
}

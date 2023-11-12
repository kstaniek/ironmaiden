terraform {
  cloud {
    organization = "kstaniek"
    workspaces {
      name = "home-s3-provisioner"
    }
  }
}

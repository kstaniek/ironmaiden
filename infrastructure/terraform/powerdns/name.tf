locals {
  dns_records = yamldecode(file("${path.module}/home_staniek_name_records.yaml"))
}

module "cf_domain_home_staniek_name" {
  source     = "./modules/pdns_domain"
  domain     = "home.staniek.name"

  dns_entries = local.dns_records.home_staniek_name
}

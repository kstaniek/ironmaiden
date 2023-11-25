module "cf_domain_ingress" {
  source     = "./modules/cf_domain"
  domain     = "staniek.io"
  account_id = data.cloudflare_accounts.me.accounts[0].id

  dns_entries = [
    {
      name  = "ipv4"
      value = local.home_ipv4
    }
  ]
}
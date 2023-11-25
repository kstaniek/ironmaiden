provider "powerdns" {
  api_key    = module.onepassword_item_powerdns.fields["api_key"]
  server_url = "http://172.31.11.88:8081"
}
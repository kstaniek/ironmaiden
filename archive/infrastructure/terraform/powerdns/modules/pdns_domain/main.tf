terraform {
  required_providers {
    powerdns = {
      source = "pan-net/powerdns"
    }
  }
}

# Add a zone
resource "powerdns_zone" "zone" {
  name        = "${var.domain}."
  kind        = "Native"
  nameservers = ["ns1.staniek.name.", "ns2.staniek.name."]
}


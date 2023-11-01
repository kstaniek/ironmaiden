resource "powerdns_record" "dns_records" {
  for_each = { for dns_entry in var.dns_entries : (dns_entry.id != null ? dns_entry.id : "${dns_entry.name}.${var.domain}.:::${dns_entry.type}") => dns_entry }
  
  zone    = var.domain
  name    = "${each.value.name}.${var.domain}."
  type    = each.value.type
  ttl     = each.value.ttl
  records = each.value.records
}

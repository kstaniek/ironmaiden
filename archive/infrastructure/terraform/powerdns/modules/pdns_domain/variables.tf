variable "domain" {
  type = string
}

variable "dns_entries" {
  type = list(object({
    id       = optional(string)
    name     = string,
    type     = optional(string, "A"),
    ttl      = optional(number, 1)
    records  = list(string)
  }))
  default = []
}

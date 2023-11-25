/* resource "cloudflare_account" "kstaniek" {
  name              = "Klaus's Account"
  type              = "standard"
  enforce_twofactor = false
} */

data "cloudflare_accounts" "me" {
  name = "Klaudiusz Staniek"
}

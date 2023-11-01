locals {
  minio_buckets = [
    /* "loki", */
    /* "thanos", */
    "volsync",
    "crunchy-postgres",
    "tagspaces",
    "zipline"
  ]
}

/* module "onepassword_item_minio" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Services"
  item   = "Minio"
} */

/* owner_access_key = lookup(module.onepassword_item_minio.fields, "${each.key}_access_key", null)
owner_secret_key = lookup(module.onepassword_item_minio.fields, "${each.key}_secret_key", null) */

module "minio_bucket" {
  for_each         = toset(local.minio_buckets)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = "00570b1b1d3c9800000000004"
  owner_secret_key = "K005l9iuR6MHY4bg40d7+iQMyvGPAJc"
  providers = {
    minio = minio.b2
  }
}

output "minio_bucket_outputs" {
  value     = module.minio_bucket
  sensitive = true
}
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    b2 = {
      source = "Backblaze/b2"
    }
  }
}

locals {
  minio_buckets = [
    /* "loki-buckets", */
    /* "thanos-buckets", */
    /* "volsync-buckets", */
    "crunchy-postgres",
    /* "tagspaces-buckets", */
    /* "zipline-buckets" */
  ]
}

provider "b2" {
}


resource "b2_bucket" "bucket" {
  count = length(local.minio_buckets)
  bucket_name = local.minio_buckets[count.index]
  bucket_type = "allPrivate"
}
provider "minio" {
  alias  = "nas"
  minio_server   = "s3.us-east-005.backblazeb2.com"
  minio_user     = "admin"
  minio_password = "admin"
}

provider "b2" {
}
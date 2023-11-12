provider "minio" {
  alias  = "nas"
  minio_server   = "s3.home.staniek.name:9091"
  minio_user     = module.onepassword_item_minio.fields.admin_username
  minio_password = module.onepassword_item_minio.fields.admin_password
}

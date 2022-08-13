variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}

module "common" {
  source = "../../modules"
}

module "storage" {
  source = "../../modules/storage"
}

module "database" {
  source = "../../modules/database"
}

module "auth" {
  source = "../../modules/auth"
  prefix = "ykoba-dev"
}

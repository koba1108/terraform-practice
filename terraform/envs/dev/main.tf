variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}

module "storage" {
  source = "../../modules/storage"
}

module "common" {
  source = "../../modules"
}

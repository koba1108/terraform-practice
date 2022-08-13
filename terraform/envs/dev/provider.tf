terraform {
  required_version = ">= 1.2.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.26.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ykoba"

    workspaces {
      name = "terraform-practice"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

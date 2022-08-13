resource "aws_s3_bucket" "ykoba-terraform" {
  bucket = "ykoba-terraform"
  tags = {
    nane = "ykoba-terraform"
  }
}

resource "aws_s3_bucket" "ykoba-terraform-2" {
  bucket = "ykoba-terraform-2"
  tags = {
    nane = "ykoba-terraform"
  }
}

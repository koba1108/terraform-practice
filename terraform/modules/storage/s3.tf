resource "aws_s3_bucket" "ykoba-terraform" {
  bucket = "ykoba-terraform"
  tags = {
    nane = "ykoba-terraform"
  }
}

resource "aws_s3_bucket" "ykoba-terraform" {
  bucket = "ykoba-terraform"
  tags = {
    Name = "ykoba-terraform"
    Environment = "development"
  }
}

resource "aws_s3_bucket" "ykoba-terraform-2" {
  bucket = "ykoba-terraform-2"
  tags = {
    Name = "ykoba-terraform"
    Environment = "development"
  }
}

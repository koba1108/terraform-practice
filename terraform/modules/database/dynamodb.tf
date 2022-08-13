resource "aws_dynamodb_table" "dynamodb-table-users" {
  name         = "users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "PK"
  range_key    = "SK"

  attribute {
    name = "PK"
    type = "S"
  }

  attribute {
    name = "SK"
    type = "S"
  }

  attribute {
    name = "recordType"
    type = "S"
  }

  global_secondary_index {
    name               = "recordType_SK"
    hash_key           = "recordType"
    range_key          = "SK"
    billing_mode       = "PAY_PER_REQUEST"
    projection_type    = "INCLUDE"
  }

  tags = {
    Name        = "ykoba-terraform"
    Environment = "development"
  }
}

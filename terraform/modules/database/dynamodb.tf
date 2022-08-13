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

  local_secondary_index {
    name            = "PK-recordType"
    range_key       = "recordType"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "SK-PK"
    hash_key        = "SK"
    range_key       = "PK"
    projection_type = "ALL"
  }

  tags = {
    Name        = "ykoba-terraform"
    Environment = "development"
  }
}

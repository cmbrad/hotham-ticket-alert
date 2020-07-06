resource "aws_dynamodb_table" "dynamodb_table" {
  name         = "hotham-alert-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "ScanDatetime"
  range_key = "ContentHash"

  attribute {
    name = "ScanDatetime"
    type = "S"
  }

  attribute {
    name = "ContentHash"
    type = "S"
  }

  tags = {
    Name        = "hotham-alert-${var.environment}"
    Application = var.application
    Environment = var.environment
  }
}

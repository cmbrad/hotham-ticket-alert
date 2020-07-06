resource "aws_s3_bucket" "s3_bucket" {
  bucket = "hotham-alert-${var.environment}"
  acl    = "private"

  tags = {
    Name        = "hotham-alert-${var.environment}"
    Application = var.application
    Environment = var.environment
  }
}

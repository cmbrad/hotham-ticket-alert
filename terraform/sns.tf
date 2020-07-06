resource "aws_sns_topic" "sns_topic" {
  name = "hotham-alert-${var.environment}"

  tags = {
    Name        = "hotham-alert-${var.environment}"
    Application = var.application
    Environment = var.environment
  }
}

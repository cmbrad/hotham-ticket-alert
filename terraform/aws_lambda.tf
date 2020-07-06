resource "aws_lambda_function" "lambda_function" {
  function_name = "hotham-alert-${var.environment}"
  role          = aws_iam_role.iam_role.arn
  handler       = "main.handler"

  s3_bucket = aws_s3_bucket.s3_bucket.id
  s3_key    = "releases/${var.artifact_version}"

  runtime = "python3.8"

  environment {
    variables = {
      Name        = "hotham-alert-${var.environment}"
      Application = var.application
      Environment = var.environment
    }
  }
}

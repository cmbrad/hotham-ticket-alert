output "s3_bucket" {
  value = aws_s3_bucket.s3_bucket
}

output "lambda_function" {
  value = aws_lambda_function.lambda_function
}

output "sns_topic" {
  value = aws_sns_topic.sns_topic
}

output "dynamodb_table" {
  value = aws_dynamodb_table.dynamodb_table
}

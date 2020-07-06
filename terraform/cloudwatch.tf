resource "aws_cloudwatch_event_rule" "cloudwatch_event_rule" {
  name                = "hotham-alert-${var.environment}"
  schedule_expression = "rate(1 hour)"

  tags = {
    Name        = "hotham-alert-${var.environment}"
    Application = var.application
    Environment = var.environment
  }
}

resource "aws_cloudwatch_event_target" "cloudwatch_event_target" {
  rule      = aws_cloudwatch_event_rule.cloudwatch_event_rule.name
  target_id = "lambda"
  arn       = aws_lambda_function.lambda_function.arn
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.cloudwatch_event_rule.arn
}

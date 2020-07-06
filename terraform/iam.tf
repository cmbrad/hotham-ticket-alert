resource "aws_iam_role" "lambda_iam_role" {
  name = "hotham-alert-lambda-${var.environment}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF

  tags = {
    Name        = "hotham-alert-${var.environment}"
    Application = var.application
    Environment = var.environment
  }
}

resource "aws_iam_role" "sfn_iam_role" {
  name = "hotham-alert-sfn-${var.environment}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "states.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF

  tags = {
    Name        = "hotham-alert-${var.environment}"
    Application = var.application
    Environment = var.environment
  }
}

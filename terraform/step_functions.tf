# resource "aws_sfn_state_machine" "sfn_state_machine" {
#   name     = "hotham-alert-${var.environment}"
#   role_arn = aws_iam_role.sfn_iam_role.arn

#   definition = <<EOF
# {
#   "Comment": "A Hello World example of the Amazon States Language using an AWS Lambda Function",
#   "StartAt": "HelloWorld",
#   "States": {
#     "HelloWorld": {
#       "Type": "Task",
#       "Resource": "${aws_lambda_function.lambda_function.arn}",
#       "End": true
#     }
#   }
# }
# EOF
# }

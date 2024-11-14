resource "aws_lambda_function" "sqs_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_sqs.lambda_handler"
  runtime       = "python3.10"
  timeout       = 30

  filename = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  environment {
    variables = {
      SQS_QUEUE_URL = aws_sqs_queue.image_queue.id
      S3_BUCKET     = var.s3_bucket_name
    }
  }

  depends_on = [aws_iam_role_policy_attachment.lambda_policy_attach]
}

resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.image_queue.arn
  function_name    = aws_lambda_function.sqs_lambda.arn
  batch_size       = 10
  enabled          = true
}

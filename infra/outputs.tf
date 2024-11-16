output "sqs_queue_url" {
  value = aws_sqs_queue.image_queue.id
}

output "lambda_function_arn" {
  value = aws_lambda_function.sqs_lambda.arn
}

# oppgave 4 

output "cloudwatch_alarm_name" {
  value       = aws_cloudwatch_metric_alarm.sqs_age_alarm.alarm_name
  description = "Name of the CloudWatch alarm for monitoring SQS"
}

output "email_subscription_confirmation" {
  value       = aws_sns_topic_subscription.email_subscription.arn
  description = "SNS email subscription confirmation"
}

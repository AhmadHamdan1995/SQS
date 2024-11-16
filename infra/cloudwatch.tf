# Oppgave 4

resource "aws_sns_topic" "sqs_alarm_topic" {
  name = "sqs-alarm-topic"
}
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.sqs_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

resource "aws_cloudwatch_metric_alarm" "sqs_age_alarm" {
  alarm_name          = "SQSApproximateAgeOfOldestMessageAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = 80
  statistic           = "Maximum"
  threshold           = var.alarm_threshold_seconds
  alarm_description   = "Alarm when the age of the oldest message in the SQS queue stay in the queue longer than the the threshold"
  dimensions = {
    QueueName = aws_sqs_queue.image_queue.name
  }
  alarm_actions = [aws_sns_topic.sqs_alarm_topic.arn]
}

output "sns_topic_arn" {
  value = aws_sns_topic.sqs_alarm_topic.arn
  description = "ARN of the SNS topic for CloudWatch alarm notifications"
}
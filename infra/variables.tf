variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "lambda-sqs-handler"
}

variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  type        = string
  default     = "image-processing-queue"
}

variable "s3_bucket_name" {
  description = "S3 bucket to store images"
  type        = string
  default     = "pgr301-couch-explorers"
}

# oppgave 4

variable "alarm_threshold_seconds" {
  description = "Threshold in seconds of ApproximateAgeOfOldestMessage"
  type        = number
  default     = 80
}

variable "notification_email" {
  description = "Email address for CloudWatch alarm to notify"
  type        = string
  default       = "ApproximateAgeOfOldestMessage metric has exceeded the specified limit (80s)."
}
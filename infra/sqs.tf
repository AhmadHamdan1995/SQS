resource "aws_sqs_queue" "image_queue" {
  name = var.sqs_queue_name
}

resource "aws_cloudwatch_event_rule" "console" {
  name        = "public-sns-message-to-outbox-topic-${var.environment}"
  description = "Sending a message to outbox topic every 5 minutes"

  schedule_expression = "rate(5 minutes)"
}
data "aws_sns_topic" "existing_data" {
  name = "outbox-topic"

}

output "sns-topic-list" {
  value = aws_sns_topic.sns-topic.*.arn
}


resource "aws_cloudwatch_event_target" "sns" {
#  for_each  = var.eventbridge_cron_aws_cloudwatch_event_target
  count = length(var.sns_topics)
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = aws_sns_topic.sns-topic.id
  arn       = aws_sns_topic.sns-topic.arn
  input     = <<JSON
  {
    "TenantId":"",
    "Type":"PKI.Evoya.Shared.Domain.Messages.PurgeOutboxMessage",
    "CorrelationId":"13ef5142-27fa-4f8e-9934-85a364a5457a"
  }
  JSON
}

 resource "aws_sns_topic" "sns-topic" {
#   count = length(var.sns_topics)
   name = var.sns_topics
 }
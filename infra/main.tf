resource "aws_cloudwatch_event_rule" "console" {
  name        = "public-sns-message-to-outbox-topic-${var.environment}"
  description = "Sending a message to outbox topic every 5 minutes"

  schedule_expression = "rate(5 minutes)"
}
#data "aws_sns_topic" "existing_data" {
#  name = "outbox-topic"
#
#}




resource "aws_cloudwatch_event_target" "sns" {
  for_each  = var.eventbridge_cron_aws_cloudwatch_event_target
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = each.key
  arn       = each.value.arn
  input     = <<JSON
  {
    "TenantId":"${each.value.tenant_id}",
    "Type":"PKI.Evoya.Shared.Domain.Messages.PurgeOutboxMessage",
    "CorrelationId":"${each.value.correlation_id}"
  }
  JSON
}

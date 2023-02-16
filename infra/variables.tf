
variable "environment" {
  default = "prod-env"
}
variable "sns_topics" {
  type = any
  default = ["patient-topic-config", "patient-linking-topic-config", "screening-topic-config", "evoyareport-topic-config", "event-history-topic-config", "outbox-topic-config"]
}
variable "eventbridge_cron_aws_cloudwatch_event_target" {
  default = {
    "ycOjpWOkTfrrnVlr" = {
      arn            = ""
#      tenant_id      = "ycOjpWOkTfrrnVlr"
      correlation_id = "13ef5142-27fa-4f8e-9934-85a364a5457a"
     },
    "DQJyL2QA6PVDEWyd" = {
      arn            = ""
#      tenant_id      = "DQJyL2QA6PVDEWyd"
      correlation_id = "13ef5142-27fa-4f8e-9934-85a364a5457a"
    },
    "TkSzKFML1hPBqNfX" = {
      arn            = ""
#      tenant_id      = "TkSzKFML1hPBqNfX"
      correlation_id = "13ef5142-27fa-4f8e-9934-85a364a5457a"
    },
    "yqbaTsmOI7b3TNwa" = {
      arn            = ""
#      tenant_id      = "yqbaTsmOI7b3TNwa"
      correlation_id = "13ef5142-27fa-4f8e-9934-85a364a5457a"
    }
  }
}

variable "tenant_id" {
  type = string
}
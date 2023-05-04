resource "aws_cloudwatch_event_rule" "cron_five_minutes" {
  name                = "cron_rate_5"
  description         = "Schedule trigger for run every 5 minutes"
  schedule_expression = "rate(5 minutes)"
  is_enabled          = true
}
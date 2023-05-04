module "noiselesstech_cron" {
  source = "hendrixroa/cron-ecs-task/aws"

  app = "noiselesstech"

  # Compute resources
  cpu_unit = 1024
  memory   = 2048

  # Cron
  event_rule = aws_cloudwatch_event_rule.cron_five_minutes.name

  # Common inputs
  execution_role_arn = aws_iam_role.ecs_task_execution.arn
  repo_url           = "${aws_ecr_repository.noiselesstech.repository_url}:latest"
  ecs_cluster        = aws_ecs_cluster.main.arn
  ecs_event_role     = aws_iam_role.ecs_events.arn
  security_groups    = [aws_security_group.sg.id]
  subnets            = module.vpc.public_subnets
  environment_list = [
    {
      name  = "blog"
      value = "noiselesstech"
    }
  ]
  use_cloudwatch_logs = true
}
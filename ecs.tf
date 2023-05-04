resource "aws_ecs_cluster" "main" {
  name = var.app_name

  capacity_providers = ["FARGATE"]
}
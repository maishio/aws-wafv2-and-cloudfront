module "cloudwatch" {
  source            = "../../resources/cloudwatch/log_group"
  name              = "/aws/ecs/${var.tags.service}-${var.tags.env}-api"
  retention_in_days = 7
  tags              = var.tags
}

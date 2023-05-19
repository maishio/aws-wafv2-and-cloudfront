module "ecs_cluster" {
  source             = "../../resources/ecs/cluster"
  capacity_providers = ["FARGATE"]
  default_capacity_provider_strategy = [
    {
      base              = 1
      capacity_provider = "FARGATE"
      weight            = 100
    }
  ]
  name = "${var.tags.service}-${var.tags.env}-api-cluster"
  tags = var.tags
}

module "ecs_task_definition" {
  source             = "../../resources/ecs/task_definition"
  cpu                = "256"
  execution_role_arn = module.iam_role.iam_role.arn
  family             = "api"
  memory             = "512"
  path               = "${path.module}/files/template/task_definition.json.tpl"
  tags               = var.tags
  vars = {
    ENV            = var.tags.env
    REGION         = var.region.id
    REPOSITORY_URL = module.ecr.ecr_repository.repository_url
    SERVICE        = var.tags.service
  }
}

module "ecs_service" {
  source = "../../resources/ecs/service"
  capacity_provider_strategy = [
    {
      base              = var.tags.env == "prod" ? 1 : 0
      capacity_provider = "FARGATE"
      weight            = 1
    },
    {
      base              = var.tags.env == "prod" ? 0 : 1
      capacity_provider = "FARGATE_SPOT"
      weight            = 1
    },
  ]
  cluster       = module.ecs_cluster.ecs_cluster.id
  desired_count = 0
  load_balancer = [
    {
      container_name   = "api"
      container_port   = 8000
      target_group_arn = var.target_group_arn
    }
  ]
  name            = "${var.tags.service}-${var.tags.env}-api-service"
  security_groups = var.security_groups
  subnets         = var.subnets
  tags            = var.tags
  task_family     = module.ecs_task_definition.ecs_task_definition.family
}

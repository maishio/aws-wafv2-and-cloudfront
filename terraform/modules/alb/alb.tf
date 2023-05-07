module "alb" {
  source          = "../../resources/elb/elb"
  internal        = false
  name            = "${var.tags.service}-${var.tags.env}-alb"
  security_groups = var.security_groups
  subnets         = var.subnets
  tags            = var.tags
  access_logs = [
    {
      bucket  = module.alb_logs.s3_bucket.id
      enabled = true
      prefix  = "alb/${var.tags.service}-${var.tags.env}-alb"
    }
  ]
}

module "target_group" {
  source                = "../../resources/elb/target_group"
  health_check_interval = 60
  health_check_matcher  = "200"
  health_check_path     = "/health"
  health_check_port     = 8000
  health_check_timeout  = 10
  name                  = "${var.tags.service}-${var.tags.env}-target-group"
  port                  = 8000
  protocol              = "HTTP"
  tags                  = var.tags
  target_type           = "ip"
  vpc_id                = var.vpc_id
}

module "listener" {
  source = "../../resources/elb/listener"
  default_action = [
    {
      target_group_arn = module.target_group.elb_target_group.arn
      type             = "forward"
    }
  ]
  load_balancer_arn = module.alb.elb.arn
  name              = "${var.tags.service}-${var.tags.env}-listener"
  port              = "80"
  protocol          = "HTTP"
  tags              = var.tags
}

module "alb_sg" {
  source              = "../../resources/vpc/security_group"
  security_group_name = "${var.tags.service}-${var.tags.env}-alb-sg"
  tags                = var.tags
  vpc_id              = var.vpc_id
  ingress_rule = {
    0 = {
      description = "Allow CloudFront"
      from_port   = 443
      /* Prefix list to allow access via CloudFront */
      prefix_list_ids = [data.aws_ec2_managed_prefix_list.this.id]
      protocol        = "tcp"
      to_port         = 443
    }
  }
}

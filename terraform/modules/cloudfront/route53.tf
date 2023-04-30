module "route53" {
  source = "../../resources/route53/record"
  alias = [
    {
      evaluate_target_health = false
      name                   = module.cloudfront.cloudfront_distribution.domain_name
      zone_id                = module.cloudfront.cloudfront_distribution.hosted_zone_id
    }
  ]
  name    = data.aws_route53_zone.this.name
  type    = "A"
  zone_id = data.aws_route53_zone.this.zone_id
}

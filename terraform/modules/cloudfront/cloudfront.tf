module "origin_access_control" {
  source                            = "../../resources/cloudfront/origin_access_control"
  description                       = "for ${var.tags.service}-${var.tags.env}-cloudfront"
  name                              = "${var.tags.service}-${var.tags.env}-origin-access-control"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

module "distribution" {
  source = "../../resources/cloudfront/distribution"
  aliases = [
    "cdn.${data.aws_route53_zone.this.name}"
  ]
  comment    = "Example Distribution"
  enabled    = true
  name       = "${var.tags.service}-${var.tags.env}-cloudfront"
  tags       = var.tags
  web_acl_id = module.wafv2.wafv2_web_acl.arn

  /* Logging */

  bucket          = module.cloudfront_logs.s3_bucket.bucket_domain_name
  include_cookies = false
  prefix          = "cloudfront/"

  /* Default Cache Behavior */

  allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  cached_methods  = ["GET", "HEAD", "OPTIONS"]
  /* ForwardedValues cannot be used when a cache policy is associated to the cache behavior */
  cache_policy_id        = data.aws_cloudfront_cache_policy.this.id
  target_origin_id       = var.alb_id
  viewer_protocol_policy = "redirect-to-https"

  /* Ordered Cache Behaviors */

  ordered_cache_behavior = [
    {
      allowed_methods = ["GET", "HEAD", "OPTIONS"]
      cached_methods  = ["GET", "HEAD", "OPTIONS"]
      default_ttl     = 300
      forwarded_values = [
        {
          forward      = "none"
          headers      = ["Origin"]
          query_string = false
        }
      ]
      target_origin_id       = module.contents.s3_bucket.id
      max_ttl                = 600
      min_ttl                = 0
      viewer_protocol_policy = "redirect-to-https"
      path_pattern           = "/static/*"
    }
  ]

  /* Origins */

  origin = [
    {
      custom_origin_config = [
        {
          http_port                = 80
          https_port               = 443
          origin_keepalive_timeout = 5
          origin_protocol_policy   = "https-only"
          origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
        }
      ]
      domain_name = "alb.${data.aws_route53_zone.this.name}"
      /* To address the error `all list elements must have the same type.` */
      origin_access_control_id = null
      origin_id                = var.alb_id
    },
    {
      /* To address the error `cannot find a common base type for all elements.` */
      custom_origin_config     = []
      domain_name              = module.contents.s3_bucket.bucket_regional_domain_name
      origin_access_control_id = module.origin_access_control.cloudfront_origin_access_control.id
      origin_id                = module.contents.s3_bucket.id
    }
  ]

  /* Restrictions */

  locations        = ["JP"]
  restriction_type = "whitelist"

  /* Viewer Certificate */

  cloudfront_default_certificate = false
  acm_certificate_arn            = module.acm.acm_certificate.arn
  minimum_protocol_version       = "TLSv1.2_2021"
  ssl_support_method             = "sni-only"
}

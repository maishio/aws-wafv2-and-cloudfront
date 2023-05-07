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
  comment             = "Example Distribution"
  default_root_object = "index.html"
  enabled             = true
  price_class         = "PriceClass_200"
  name                = "${var.tags.service}-${var.tags.env}-cloudfront"
  tags                = var.tags
  web_acl_id          = module.wafv2.wafv2_web_acl.arn

  /* Logging */

  bucket          = module.cloudfront_logs.s3_bucket.bucket_domain_name
  include_cookies = false
  prefix          = "cloudfront/"

  /* Custom Error Responses */

  custom_error_response = [
    {
      error_code         = 403
      response_code      = 200
      response_page_path = "/error403.html"
    },
    {
      error_code         = 404
      response_code      = 200
      response_page_path = "/error404.html"
    }
  ]
  /* Default Cache Behavior */

  allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  cached_methods  = ["GET", "HEAD"]
  /* ForwardedValues cannot be used when a cache policy is associated to the cache behavior. */
  cache_policy_id        = data.aws_cloudfront_cache_policy.s3.id
  default_ttl            = 86400
  max_ttl                = 31536000
  min_ttl                = 0
  target_origin_id       = module.contents.s3_bucket.id
  viewer_protocol_policy = "allow-all"

  /* Ordered Cache Behaviors */

  ordered_cache_behavior = [
    {
      allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
      cached_methods  = ["GET", "HEAD", "OPTIONS"]
      /* ForwardedValues cannot be used when a cache policy is associated to the cache behavior */
      cache_policy_id        = data.aws_cloudfront_cache_policy.alb.id
      default_ttl            = 86400
      max_ttl                = 31536000
      min_ttl                = 0
      target_origin_id       = var.alb_id
      viewer_protocol_policy = "redirect-to-https"
      path_pattern           = "/api/*"
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
          origin_protocol_policy   = "http-only"
          origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
        }
      ]
      domain_name = var.alb_dns_name
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

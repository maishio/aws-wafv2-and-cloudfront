module "cloudfront" {
  source = "../../resources/cloudfront/distribution"
  aliases = [
    data.aws_route53_zone.this.name
  ]
  comment             = "${var.tags.service}-${var.tags.env}-cloudfront"
  default_root_object = "index.html"
  enabled             = true
  name                = "${var.tags.service}-${var.tags.env}-cloudfront"
  tags                = var.tags
  web_acl_id          = module.wafv2.wafv2_web_acl.arn

  /* Logging */

  bucket          = module.cloudfront_logs.s3_bucket.bucket_domain_name
  include_cookies = false
  prefix          = "cloudfront/"

  /* Default Cache Behavior */

  allowed_methods = ["GET", "HEAD"]
  cached_methods  = ["GET", "HEAD"]
  default_ttl     = 0
  forwarded_values = [
    {
      headers      = ["*"]
      query_string = true
      forward      = "all"
    }
  ]
  max_ttl                = 3600
  min_ttl                = 86400
  target_origin_id       = module.s3.s3_bucket.id
  viewer_protocol_policy = "redirect-to-https"

  /* Origins */

  origin = [
    {
      domain_name = module.s3.s3_bucket.bucket_regional_domain_name
      origin_id   = module.s3.s3_bucket.id
      s3_origin_config = [
        {
          origin_access_identity = module.origin_access_identity.cloudfront_origin_access_identity.cloudfront_access_identity_path
        }
      ]
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

module "origin_access_identity" {
  source  = "../../resources/cloudfront/origin_access_identity"
  comment = "for ${var.tags.service}-${var.tags.env}-cloudfront"
}

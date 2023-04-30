module "waf_logs" {
  source        = "../../resources/s3/bucket"
  bucket        = "aws-waf-logs-${var.tags.service}-${var.tags.env}-alb-${var.account.id}"
  force_destroy = true
  tags          = var.tags
}

module "waf_logs_lifecycle" {
  source = "../../resources/s3/bucket_lifecycle_configuration"
  bucket = module.waf_logs.s3_bucket.bucket
  rule = [
    {
      id     = "wafv2"
      status = "Enabled"
      transition = [
        {
          days          = 30
          storage_class = "GLACIER"
        }
      ],
      expiration = [
        {
          days = 365
        }
      ]
    }
  ]
}

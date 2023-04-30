module "cloudfront_logs" {
  source        = "../../resources/s3/bucket"
  bucket        = "${var.tags.service}-${var.tags.env}-cloudfront-logs-${var.account.id}"
  force_destroy = true
  tags          = var.tags
}

module "cloudfront_logs_ownership_controls" {
  source           = "../../resources/s3/bucket_ownership_controls"
  bucket           = module.cloudfront_logs.s3_bucket.id
  object_ownership = "BucketOwnerPreferred"
}

module "cloudfront_logs_lifecycle" {
  source = "../../resources/s3/bucket_lifecycle_configuration"
  bucket = module.cloudfront_logs.s3_bucket.id
  rule = [
    {
      id     = "cloudfront"
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

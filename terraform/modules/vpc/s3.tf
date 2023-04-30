module "s3" {
  source        = "../../resources/s3/bucket"
  bucket        = "${var.tags.service}-${var.tags.env}-flow-logs"
  force_destroy = true
  tags          = var.tags
}

module "s3_lifecycle" {
  source = "../../resources/s3/bucket_lifecycle_configuration"
  bucket = module.s3.s3_bucket.bucket
  rule = [
    {
      id     = "flow_logs"
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

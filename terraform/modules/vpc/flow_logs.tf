module "flow_logs" {
  source        = "../../resources/s3/bucket"
  bucket        = "${var.tags.service}-${var.tags.env}-flow-logs-${var.account.id}"
  force_destroy = true
  tags          = var.tags
}

module "flow_logs_lifecycle" {
  source = "../../resources/s3/bucket_lifecycle_configuration"
  bucket = module.flow_logs.s3_bucket.id
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

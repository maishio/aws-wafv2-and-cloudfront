module "alb_logs" {
  source        = "../../resources/s3/bucket"
  bucket        = "${var.tags.service}-${var.tags.env}-alb-logs-${var.account.id}"
  force_destroy = true
  tags          = var.tags
}

module "alb_logs_lifecycle" {
  source = "../../resources/s3/bucket_lifecycle_configuration"
  bucket = module.alb_logs.s3_bucket.id
  rule = [
    {
      id     = "alb"
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

module "alb_logs_policy" {
  source = "../../resources/s3/bucket_policy"
  bucket = module.alb_logs.s3_bucket.id
  path   = "${path.module}/files/template/alb_s3_bucket_policy.json.tpl"
  vars = {
    ACCOUNT    = data.aws_elb_service_account.this.arn
    BUCKET_ARN = module.alb_logs.s3_bucket.arn
  }
}

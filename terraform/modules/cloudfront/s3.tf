module "s3" {
  source        = "../../resources/s3/bucket"
  bucket        = "${var.tags.service}-${var.tags.env}-cloudfront-bucket"
  force_destroy = true
  tags          = var.tags
}

module "s3_policy" {
  source = "../../resources/s3/bucket_policy"
  bucket = module.s3.s3_bucket.id
  path   = "${path.module}/files/template/cloudfront_s3_bucket_policy.json.tpl"
  vars = {
    BUCKET     = module.s3.s3_bucket.id
    CLOUDFRONT = module.origin_access_identity.cloudfront_origin_access_identity.iam_arn
  }
}

module "s3_versioning" {
  source = "../../resources/s3/bucket_versioning"
  bucket = module.s3.s3_bucket.id
  status = "Enabled"
}

module "s3_object" {
  source       = "../../resources/s3/object"
  bucket       = module.s3.s3_bucket.id
  content_type = "text/html"
  key          = "index.html"
  path         = "${path.module}/files/object/index.html"
  tags         = var.tags
}

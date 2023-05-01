module "contents" {
  source        = "../../resources/s3/bucket"
  bucket        = "${var.tags.service}-${var.tags.env}-contents"
  force_destroy = true
  tags          = var.tags
}

module "contents_policy" {
  source = "../../resources/s3/bucket_policy"
  bucket = module.contents.s3_bucket.id
  path   = "${path.module}/files/template/cloudfront_s3_bucket_policy.json.tpl"
  vars = {
    BUCKET     = module.contents.s3_bucket.id
    CLOUDFRONT = module.origin_access_identity.cloudfront_origin_access_identity.iam_arn
  }
}

module "contents_versioning" {
  source = "../../resources/s3/bucket_versioning"
  bucket = module.contents.s3_bucket.id
  status = "Enabled"
}

module "contents_object" {
  source       = "../../resources/s3/object"
  bucket       = module.contents.s3_bucket.id
  content_type = "application/json"
  key          = "static/test.json"
  path         = "${path.module}/files/object/test.json"
  tags         = var.tags
}

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
    BUCKET_ARN       = module.contents.s3_bucket.arn
    DISTRIBUTION_ARN = module.distribution.cloudfront_distribution.arn
  }
}

module "contents_versioning" {
  source = "../../resources/s3/bucket_versioning"
  bucket = module.contents.s3_bucket.id
  status = "Enabled"
}

module "contents_object" {
  source = "../../resources/s3/object"
  bucket = module.contents.s3_bucket.id
  objects = {
    0 = {
      content_type = "application/json"
      key          = "test.json"
      source       = "${path.module}/files/object/test.json"
    },
    1 = {
      content_type = "text/html"
      key          = "index.html"
      source       = "${path.module}/files/object/index.html"
    },
    2 = {
      content_type = "text/html"
      key          = "error403.html"
      source       = "${path.module}/files/object/error403.html"
    },
    3 = {
      content_type = "text/html"
      key          = "error404.html"
      source       = "${path.module}/files/object/error404.html"
    }
  }
  tags = var.tags
}

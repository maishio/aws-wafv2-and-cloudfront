# Amazon S3 Object
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object

resource "aws_s3_object" "this" {
  bucket       = var.bucket
  content_type = var.content_type
  key          = var.key
  /* rename soruce variable to path */
  /* The variable name "source" is reserved due to its special meaning inside module blocks. */
  source = var.path
  tags   = merge(var.tags, { "Name" = var.key })
}

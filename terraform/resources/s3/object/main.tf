# Amazon S3 Object
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object

resource "aws_s3_object" "this" {
  for_each     = var.objects
  bucket       = var.bucket
  content_type = each.value.content_type
  key          = each.value.key
  source       = each.value.source
  tags         = merge(var.tags, { "Name" = each.value.key })
}

# Amazon CloudFront Origin Access Identity
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = var.comment
}

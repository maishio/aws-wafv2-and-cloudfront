# Amazon CloudFront Origin Access Control
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control

resource "aws_cloudfront_origin_access_control" "this" {
  name                              = var.name
  description                       = var.description
  origin_access_control_origin_type = var.origin_access_control_origin_type
  signing_behavior                  = var.signing_behavior
  signing_protocol                  = var.signing_protocol
}

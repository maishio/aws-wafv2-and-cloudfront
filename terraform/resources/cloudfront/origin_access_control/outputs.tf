# Amazon CloudFront Origin Access Control
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control

output "cloudfront_origin_access_control" {
  description = "Amazon CloudFront Origin Access Control resource."
  value       = aws_cloudfront_origin_access_control.this
}

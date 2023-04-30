# Amazon CloudFront Origin Access Identity
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity

output "cloudfront_origin_access_identity" {
  description = "Amazon CloudFront Origin Access Identity resource."
  value       = aws_cloudfront_origin_access_identity.this
}

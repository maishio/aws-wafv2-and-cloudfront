# Amazon CloudFront Distribution
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution

output "cloudfront_distribution" {
  description = "Amazon CloudFront Distribution resource."
  value       = aws_cloudfront_distribution.this
}

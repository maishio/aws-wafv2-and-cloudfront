# Amazon CloudFront Response Header Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy

output "cloudfront_response_headers_policy" {
  description = "Amazon CloudFront Response Header Policy resource."
  value       = aws_cloudfront_response_headers_policy.this
}

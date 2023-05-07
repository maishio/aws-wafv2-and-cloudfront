# Amazon Route53 Public Hosted zone Data Source
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone

data "aws_route53_zone" "this" {
  name         = var.hostzone.name
  private_zone = false
}

/* List of available managed cache policy names.
aws cloudfront list-cache-policies --query 'CachePolicyList.Items[].CachePolicy.CachePolicyConfig.Name'
[
    "Managed-CachingOptimized",
    "Managed-CachingDisabled",
    "Managed-CachingOptimizedForUncompressedObjects",
    "Managed-Elemental-MediaPackage",
    "Managed-Amplify"
]
*/

# Managed Cache Policies
# https://docs.aws.amazon.com/ja_jp/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html

data "aws_cloudfront_cache_policy" "s3" {
  name = "Managed-Elemental-MediaPackage"
}

# Managed Cache Policies
# https://docs.aws.amazon.com/ja_jp/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html

data "aws_cloudfront_cache_policy" "alb" {
  name = "Managed-CachingOptimized"
}

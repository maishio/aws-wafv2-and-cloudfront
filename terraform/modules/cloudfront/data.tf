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

data "aws_cloudfront_cache_policy" "this" {
  name = "Managed-CachingOptimized"
}

/* List of available managed origin request policy names.
aws cloudfront list-origin-request-policies --query 'OriginRequestPolicyList.Items[].OriginRequestPolicy.OriginRequestPolicyConfig.Name'
[
    "Managed-UserAgentRefererHeaders",
    "Managed-AllViewer",
    "Managed-CORS-S3Origin",
    "Managed-CORS-CustomOrigin",
    "Managed-Elemental-MediaTailor-PersonalizedManifests",
    "Managed-AllViewerAndCloudFrontHeaders-2022-06",
    "Managed-AllViewerExceptHostHeader"
]
*/

# Managed Origin Request Policies
# https://docs.aws.amazon.com/ja_jp/AmazonCloudFront/latest/DeveloperGuide/using-managed-origin-request-policies.html

data "aws_cloudfront_origin_request_policy" "asset" {
  name = "Managed-CORS-S3Origin"
}

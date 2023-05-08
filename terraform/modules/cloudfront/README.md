## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.62.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.62.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | ../../resources/acm | n/a |
| <a name="module_cloudfront_logs"></a> [cloudfront\_logs](#module\_cloudfront\_logs) | ../../resources/s3/bucket | n/a |
| <a name="module_cloudfront_logs_lifecycle"></a> [cloudfront\_logs\_lifecycle](#module\_cloudfront\_logs\_lifecycle) | ../../resources/s3/bucket_lifecycle_configuration | n/a |
| <a name="module_cloudfront_logs_ownership_controls"></a> [cloudfront\_logs\_ownership\_controls](#module\_cloudfront\_logs\_ownership\_controls) | ../../resources/s3/bucket_ownership_controls | n/a |
| <a name="module_contents"></a> [contents](#module\_contents) | ../../resources/s3/bucket | n/a |
| <a name="module_contents_object"></a> [contents\_object](#module\_contents\_object) | ../../resources/s3/object | n/a |
| <a name="module_contents_policy"></a> [contents\_policy](#module\_contents\_policy) | ../../resources/s3/bucket_policy | n/a |
| <a name="module_contents_versioning"></a> [contents\_versioning](#module\_contents\_versioning) | ../../resources/s3/bucket_versioning | n/a |
| <a name="module_distribution"></a> [distribution](#module\_distribution) | ../../resources/cloudfront/distribution | n/a |
| <a name="module_origin_access_control"></a> [origin\_access\_control](#module\_origin\_access\_control) | ../../resources/cloudfront/origin_access_control | n/a |
| <a name="module_route53"></a> [route53](#module\_route53) | ../../resources/route53/record | n/a |
| <a name="module_waf_logs"></a> [waf\_logs](#module\_waf\_logs) | ../../resources/s3/bucket | n/a |
| <a name="module_waf_logs_lifecycle"></a> [waf\_logs\_lifecycle](#module\_waf\_logs\_lifecycle) | ../../resources/s3/bucket_lifecycle_configuration | n/a |
| <a name="module_wafv2"></a> [wafv2](#module\_wafv2) | ../../resources/wafv2/web_acl | n/a |
| <a name="module_wafv2_logging"></a> [wafv2\_logging](#module\_wafv2\_logging) | ../../resources/wafv2/web_acl_logging_configuration | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_cache_policy.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_cache_policy) | data source |
| [aws_cloudfront_cache_policy.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_cache_policy) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | AWS Account ID. | `map(string)` | n/a | yes |
| <a name="input_alb_dns_name"></a> [alb\_dns\_name](#input\_alb\_dns\_name) | DNS name of the ALB. | `string` | n/a | yes |
| <a name="input_alb_id"></a> [alb\_id](#input\_alb\_id) | ID of the ALB. | `string` | n/a | yes |
| <a name="input_hostzone"></a> [hostzone](#input\_hostzone) | A map of Route53 Hosted Zone to create the DNS record in. | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

No outputs.

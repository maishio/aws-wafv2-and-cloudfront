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
| <a name="module_alb"></a> [alb](#module\_alb) | ../../resources/elb/elb | n/a |
| <a name="module_alb_logs"></a> [alb\_logs](#module\_alb\_logs) | ../../resources/s3/bucket | n/a |
| <a name="module_alb_logs_lifecycle"></a> [alb\_logs\_lifecycle](#module\_alb\_logs\_lifecycle) | ../../resources/s3/bucket_lifecycle_configuration | n/a |
| <a name="module_alb_logs_policy"></a> [alb\_logs\_policy](#module\_alb\_logs\_policy) | ../../resources/s3/bucket_policy | n/a |
| <a name="module_listener"></a> [listener](#module\_listener) | ../../resources/elb/listener | n/a |
| <a name="module_target_group"></a> [target\_group](#module\_target\_group) | ../../resources/elb/target_group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_elb_service_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | AWS Account ID. | `map(string)` | n/a | yes |
| <a name="input_hostzone"></a> [hostzone](#input\_hostzone) | A map of Route53 Hosted Zone to create the DNS record in. | `map(string)` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | A list of security group IDs to assign to the ALB. | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnet IDs to attach to the ALB. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to create the ALB in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | DNS name of the ALB. |
| <a name="output_alb_id"></a> [alb\_id](#output\_alb\_id) | ID of the ALB. |
| <a name="output_alb_target_group_arn"></a> [alb\_target\_group\_arn](#output\_alb\_target\_group\_arn) | ARN of the ALB target group. |

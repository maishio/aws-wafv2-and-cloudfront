# AWS WAFv2 Web ACL Terraform Resource

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | ~> 1.4.0 |

## Providers

| Name | Version   |
| ---- | --------- |
| aws  | ~> 4.57.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                | Type     |
| ------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_wafv2_web_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |

## Inputs

| Name                                                                                                            | Description                                                                                 | Type          | Default | Required |
| --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_cloudwatch_metrics_enabled"></a> [cloudwatch_metrics_enabled](#input_cloudwatch_metrics_enabled) | Whether the associated resource sends metrics to CloudWatch.                                | `bool`        | `false` |    no    |
| <a name="input_description"></a> [description](#input_description)                                              | Description of the Web ACL.                                                                 | `string`      | `null`  |    no    |
| <a name="input_metric_name"></a> [metric_name](#input_metric_name)                                              | Name of the CloudWatch metric.                                                              | `string`      | `null`  |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                   | Name of the Web ACL.                                                                        | `string`      | n/a     |   yes    |
| <a name="input_rule"></a> [rule](#input_rule)                                                                   | Dynamic block for the rule.                                                                 | `list(any)`   | `[]`    |    no    |
| <a name="input_sampled_requests_enabled"></a> [sampled_requests_enabled](#input_sampled_requests_enabled)       | Whether AWS WAF should store a sampling of the web requests that match the rules.           | `bool`        | `false` |    no    |
| <a name="input_scope"></a> [scope](#input_scope)                                                                | Specifies whether this is for an AWS CloudFront distribution or for a regional application. | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                   | Map of key-value pairs to associate with the resource.                                      | `map(string)` | `{}`    |    no    |

## Outputs

| Name                                                                       | Description                 |
| -------------------------------------------------------------------------- | --------------------------- |
| <a name="output_wafv2_web_acl"></a> [wafv2_web_acl](#output_wafv2_web_acl) | AWS WAFv2 Web ACL resource. |

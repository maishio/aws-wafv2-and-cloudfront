# AWS WAFv2 Web ACL Logging Configuration Terraform Resource

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

| Name                                                                                                                                                            | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_wafv2_web_acl_logging_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) | resource |

## Inputs

| Name                                                                                                   | Description                                                                                                                                    | Type           | Default | Required |
| ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------- | :------: |
| <a name="input_log_destination_configs"></a> [log_destination_configs](#input_log_destination_configs) | Amazon Kinesis Data Firehose, Cloudwatch Log log group, or S3 bucket Amazon Resource Names (ARNs) that you want to associate with the web ACL. | `list(string)` | n/a     |   yes    |
| <a name="input_resource_arn"></a> [resource_arn](#input_resource_arn)                                  | ARN of the resource to associate with the web ACL.                                                                                             | `string`       | n/a     |   yes    |

## Outputs

| Name                                                                                                                                         | Description |
| -------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_wafv2_web_acl_logging_configuration"></a> [wafv2_web_acl_logging_configuration](#output_wafv2_web_acl_logging_configuration) | n/a         |

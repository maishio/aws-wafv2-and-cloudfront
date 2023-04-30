# Amazon CloudWatch Logs Log Group Terraform Resource

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.4.0 |

## Providers

| Name | Version   |
| ---- | --------- |
| aws  | ~> 4.57.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                              | Type     |
| --------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name                                                                                 | Description                                                              | Type          | Default | Required |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------- | ------- | :------: |
| <a name="input_kms_key_id"></a> [kms_key_id](#input_kms_key_id)                      | ARN of the KMS Key to use when encrypting log data.                      | `string`      | `null`  |    no    |
| <a name="input_name"></a> [name](#input_name)                                        | Name of the log group.                                                   | `string`      | n/a     |   yes    |
| <a name="input_retention_in_days"></a> [retention_in_days](#input_retention_in_days) | Number of days you want to retain log events in the specified log group. | `number`      | `0`     |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                        | A mapping of tags to assign to the resource.                             | `map(string)` | `{}`    |    no    |

## Outputs

| Name                                                                                            | Description |
| ----------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_cloudwatch_log_group"></a> [cloudwatch_log_group](#output_cloudwatch_log_group) | n/a         |

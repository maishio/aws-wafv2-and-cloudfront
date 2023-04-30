# Amazon VPC Flow Log Terraform Resource

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.4.0 |

## Providers

| Name | Version   |
| ---- | --------- |
| aws  | ~> 4.62.0 |

## Modules

No modules.

## Resources

| Name                                                                                                      | Type     |
| --------------------------------------------------------------------------------------------------------- | -------- |
| [aws_flow_log.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |

## Inputs

| Name                                                                                                                     | Description                                             | Type          | Default              | Required |
| ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------- | ------------- | -------------------- | :------: |
| <a name="input_eni_id"></a> [eni_id](#input_eni_id)                                                                      | Elastic Network Interface ID.                           | `string`      | `null`               |    no    |
| <a name="input_file_format"></a> [file_format](#input_file_format)                                                       | Format for the flow log.                                | `string`      | `"plain-text"`       |    no    |
| <a name="input_hive_compatible_partitions"></a> [hive_compatible_partitions](#input_hive_compatible_partitions)          | Indicates whether to create Hive-compatible partitions. | `bool`        | `false`              |    no    |
| <a name="input_iam_role_arn"></a> [iam_role_arn](#input_iam_role_arn)                                                    | ARN of the IAM role that posts logs to CloudWatch Logs. | `string`      | `null`               |    no    |
| <a name="input_log_destination"></a> [log_destination](#input_log_destination)                                           | ARN of the logging destination.                         | `string`      | `null`               |    no    |
| <a name="input_log_destination_type"></a> [log_destination_type](#input_log_destination_type)                            | Type of the logging destination.                        | `string`      | `"cloud-watch-logs"` |    no    |
| <a name="input_log_group_name"></a> [log_group_name](#input_log_group_name)                                              | Name of the CloudWatch log group.                       | `string`      | `null`               |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                            | Name of the flow log.                                   | `string`      | n/a                  |   yes    |
| <a name="input_per_hour_partition"></a> [per_hour_partition](#input_per_hour_partition)                                  | Indicates whether to create a new partition every hour. | `bool`        | `false`              |    no    |
| <a name="input_subnet_id"></a> [subnet_id](#input_subnet_id)                                                             | Subnet ID.                                              | `string`      | `null`               |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                            | A mapping of tags to assign to the resource             | `map(string)` | `{}`                 |    no    |
| <a name="input_traffic_type"></a> [traffic_type](#input_traffic_type)                                                    | Type of traffic to capture.                             | `string`      | n/a                  |   yes    |
| <a name="input_transit_gateway_attachment_id"></a> [transit_gateway_attachment_id](#input_transit_gateway_attachment_id) | Transit Gateway Attachment ID.                          | `string`      | `null`               |    no    |
| <a name="input_transit_gateway_id"></a> [transit_gateway_id](#input_transit_gateway_id)                                  | Transit Gateway ID.                                     | `string`      | `null`               |    no    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                                                                      | VPC ID.                                                 | `string`      | `null`               |    no    |

## Outputs

| Name                                                        | Description                   |
| ----------------------------------------------------------- | ----------------------------- |
| <a name="output_flow_log"></a> [flow_log](#output_flow_log) | Amazon VPC Flow Log resource. |

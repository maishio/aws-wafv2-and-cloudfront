# Amazon VPC Terraform Resource

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

| Name                                                                                            | Type     |
| ----------------------------------------------------------------------------------------------- | -------- |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name                                                                                          | Description                                                | Type          | Default     | Required |
| --------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | ------------- | ----------- | :------: |
| <a name="input_cidr_block"></a> [cidr_block](#input_cidr_block)                               | The IPv4 CIDR block for the VPC.                           | `string`      | n/a         |   yes    |
| <a name="input_enable_dns_hostnames"></a> [enable_dns_hostnames](#input_enable_dns_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC. | `bool`        | `true`      |    no    |
| <a name="input_enable_dns_support"></a> [enable_dns_support](#input_enable_dns_support)       | A boolean flag to enable/disable DNS support in the VPC.   | `bool`        | `true`      |    no    |
| <a name="input_instance_tenancy"></a> [instance_tenancy](#input_instance_tenancy)             | A tenancy option for instances launched into the VPC.      | `string`      | `"default"` |    no    |
| <a name="input_name"></a> [name](#input_name)                                                 | VPC name.                                                  | `string`      | n/a         |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                 | A mapping of tags to assign to the resource.               | `map(string)` | `{}`        |    no    |

## Outputs

| Name                                         | Description          |
| -------------------------------------------- | -------------------- |
| <a name="output_vpc"></a> [vpc](#output_vpc) | Amazon VPC resource. |

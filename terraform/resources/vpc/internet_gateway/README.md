# AWS VPC Internet Gateway Terraform Resource

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

| Name                                                                                                                      | Type     |
| ------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |

## Inputs

| Name                                                | Description                                 | Type          | Default | Required |
| --------------------------------------------------- | ------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_name"></a> [name](#input_name)       | Internet Gateway name                       | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)       | A mapping of tags to assign to the resource | `map(string)` | `{}`    |    no    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id) | VPC ID                                      | `string`      | n/a     |   yes    |

## Outputs

| Name                                                                                | Description                           |
| ----------------------------------------------------------------------------------- | ------------------------------------- |
| <a name="output_internet_gateway"></a> [internet_gateway](#output_internet_gateway) | Amazon VPC Internet Gateway resource. |

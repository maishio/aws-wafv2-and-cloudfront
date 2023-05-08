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
| <a name="module_flow_log"></a> [flow\_log](#module\_flow\_log) | ../../resources/vpc/flow_log | n/a |
| <a name="module_flow_logs"></a> [flow\_logs](#module\_flow\_logs) | ../../resources/s3/bucket | n/a |
| <a name="module_flow_logs_lifecycle"></a> [flow\_logs\_lifecycle](#module\_flow\_logs\_lifecycle) | ../../resources/s3/bucket_lifecycle_configuration | n/a |
| <a name="module_internet_gateway"></a> [internet\_gateway](#module\_internet\_gateway) | ../../resources/vpc/internet_gateway | n/a |
| <a name="module_nat_gateway"></a> [nat\_gateway](#module\_nat\_gateway) | ../../resources/vpc/nat_gateway | n/a |
| <a name="module_private_route_table_1a"></a> [private\_route\_table\_1a](#module\_private\_route\_table\_1a) | ../../resources/vpc/route_table | n/a |
| <a name="module_private_route_table_1c"></a> [private\_route\_table\_1c](#module\_private\_route\_table\_1c) | ../../resources/vpc/route_table | n/a |
| <a name="module_private_subnet"></a> [private\_subnet](#module\_private\_subnet) | ../../resources/vpc/subnet | n/a |
| <a name="module_public_route_table"></a> [public\_route\_table](#module\_public\_route\_table) | ../../resources/vpc/route_table | n/a |
| <a name="module_public_subnet"></a> [public\_subnet](#module\_public\_subnet) | ../../resources/vpc/subnet | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../resources/vpc/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | AWS Account ID. | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | Private subnet IDs |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Public subnet IDs |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |

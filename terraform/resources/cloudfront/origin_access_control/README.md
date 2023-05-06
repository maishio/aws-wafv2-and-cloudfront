# Amazon CloudFront Origin Access Control Terraform Resource

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | ~> 1.4.0 |

## Providers

| Name | Version   |
| ---- | --------- |
| aws  | ~> 4.62.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                      | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_cloudfront_origin_access_control.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |

## Inputs

| Name                                                                                                                                 | Description                                               | Type     | Default                  | Required |
| ------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------- | -------- | ------------------------ | :------: |
| <a name="input_description"></a> [description](#input_description)                                                                   | Description of the Origin Access Control.                 | `string` | `"Managed by Terraform"` |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                                        | Name of the Origin Access Control.                        | `string` | n/a                      |   yes    |
| <a name="input_origin_access_control_origin_type"></a> [origin_access_control_origin_type](#input_origin_access_control_origin_type) | Type of origin that this Origin Access Control is for..   | `string` | n/a                      |   yes    |
| <a name="input_signing_behavior"></a> [signing_behavior](#input_signing_behavior)                                                    | Specifies which requests CloudFront signs.                | `string` | n/a                      |   yes    |
| <a name="input_signing_protocol"></a> [signing_protocol](#input_signing_protocol)                                                    | Determines how CloudFront signs (authenticates) requests. | `string` | n/a                      |   yes    |

## Outputs

| Name                                                                                                                                | Description                                       |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| <a name="output_cloudfront_origin_access_control"></a> [cloudfront_origin_access_control](#output_cloudfront_origin_access_control) | Amazon CloudFront Origin Access Control resource. |

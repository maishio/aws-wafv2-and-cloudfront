# Amazon CloudFront Response Header Policy Terraform Resource

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

| Name                                                                                                                                                          | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_cloudfront_response_headers_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy) | resource |

## Inputs

| Name                                                                                                                  | Description                                                     | Type        | Default                  | Required |
| --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ----------- | ------------------------ | :------: |
| <a name="input_comment"></a> [comment](#input_comment)                                                                | Comment to describe the response headers policy.                | `string`    | `"Managed by Terraform"` |    no    |
| <a name="input_cors_config"></a> [cors_config](#input_cors_config)                                                    | Dynamic block defining the CORS configuration.                  | `list(any)` | `[]`                     |    no    |
| <a name="input_custom_headers_config"></a> [custom_headers_config](#input_custom_headers_config)                      | Dynamic block defining the custom headers configuration.        | `list(any)` | `[]`                     |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                         | Name of the response headers policy.                            | `string`    | n/a                      |   yes    |
| <a name="input_server_timing_headers_config"></a> [server_timing_headers_config](#input_server_timing_headers_config) | Dynamic block defining the server timing headers configuration. | `list(any)` | `[]`                     |    no    |

## Outputs

| Name                                                                                                                                      | Description                                        |
| ----------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| <a name="output_cloudfront_response_headers_policy"></a> [cloudfront_response_headers_policy](#output_cloudfront_response_headers_policy) | Amazon CloudFront Response Header Policy resource. |

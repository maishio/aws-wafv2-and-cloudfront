# Amazon CloudFront Origin Access Identity Terraform Resource

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

| Name                                                                                                                                                        | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_cloudfront_origin_access_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |

## Inputs

| Name                                                   | Description                                         | Type     | Default                  | Required |
| ------------------------------------------------------ | --------------------------------------------------- | -------- | ------------------------ | :------: |
| <a name="input_comment"></a> [comment](#input_comment) | An optional comment for the origin access identity. | `string` | `"Managed by Terraform"` |    no    |

## Outputs

| Name                                                                                                                                   | Description                                        |
| -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| <a name="output_cloudfront_origin_access_identity"></a> [cloudfront_origin_access_identity](#output_cloudfront_origin_access_identity) | Amazon CloudFront Origin Access Identity resource. |

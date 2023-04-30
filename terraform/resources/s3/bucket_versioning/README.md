# Amazon S3 Bucket Versioning Terraform Resource

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
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name                                                | Description                                                                             | Type     | Default      | Required |
| --------------------------------------------------- | --------------------------------------------------------------------------------------- | -------- | ------------ | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket) | Name of the bucket.                                                                     | `string` | n/a          |   yes    |
| <a name="input_status"></a> [status](#input_status) | Versioning state of the bucket. Valid values are `Enabled`, `Suspended`, or `Disabled`. | `string` | `"Disabled"` |    no    |

## Outputs

| Name                                                                                            | Description                           |
| ----------------------------------------------------------------------------------------------- | ------------------------------------- |
| <a name="output_s3_bucket_versioning"></a> [s3_bucket_versioning](#output_s3_bucket_versioning) | Amazon S3 Bucket Versioning resource. |

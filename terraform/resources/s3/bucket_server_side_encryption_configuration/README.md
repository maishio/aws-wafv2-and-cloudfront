# Amazon S3 Bucket Server Side Encryption Configuration Terraform Resource

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

| Name                                                                                                                                                                                  | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |

## Inputs

| Name                                                                                    | Description                                                                       | Type     | Default    | Required |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | -------- | ---------- | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket)                                     | Name of the bucket.                                                               | `string` | n/a        |   yes    |
| <a name="input_bucket_key_enabled"></a> [bucket_key_enabled](#input_bucket_key_enabled) | Whether or not to use Amazon S3 Bucket Keys for SSE-KMS.                          | `bool`   | `false`    |    no    |
| <a name="input_kms_master_key_id"></a> [kms_master_key_id](#input_kms_master_key_id)    | AWS KMS master key ID used for the SSE-KMS encryption.                            | `string` | `null`     |    no    |
| <a name="input_sse_algorithm"></a> [sse_algorithm](#input_sse_algorithm)                | Server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`. | `string` | `"AES256"` |    no    |

## Outputs

| Name                                                                                                                                                                          | Description                |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| <a name="output_s3_bucket_server_side_encryption_configuration"></a> [s3_bucket_server_side_encryption_configuration](#output_s3_bucket_server_side_encryption_configuration) | Amazon S3 Bucket resource. |

# Amazon S3 Bucket ACL Terraform Resource

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

| Name                                                                                                                | Type     |
| ------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |

## Inputs

| Name                                                                                             | Description                              | Type        | Default | Required |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------- | ----------- | ------- | :------: |
| <a name="input_access_control_policy"></a> [access_control_policy](#input_access_control_policy) | Dynamic block for access control policy. | `list(any)` | `[]`    |    no    |
| <a name="input_acl"></a> [acl](#input_acl)                                                       | Canned ACL to apply to the bucket.       | `string`    | `null`  |    no    |
| <a name="input_bucket"></a> [bucket](#input_bucket)                                              | Name of the bucket.                      | `string`    | n/a     |   yes    |

## Outputs

| Name                                                                       | Description                    |
| -------------------------------------------------------------------------- | ------------------------------ |
| <a name="output_s3_bucket_acl"></a> [s3_bucket_acl](#output_s3_bucket_acl) | Amazon S3 Bucket ACL resource. |

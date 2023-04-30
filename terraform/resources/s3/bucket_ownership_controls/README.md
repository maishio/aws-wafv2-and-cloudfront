# Amazon S3 Bucket Ownership Controls Terraform Resource

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

| Name                                                                                                                                              | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_s3_bucket_ownership_controls.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |

## Inputs

| Name                                                                              | Description         | Type     | Default | Required |
| --------------------------------------------------------------------------------- | ------------------- | -------- | ------- | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket)                               | Name of the bucket. | `string` | n/a     |   yes    |
| <a name="input_object_ownership"></a> [object_ownership](#input_object_ownership) | Object ownership.   | `string` | n/a     |   yes    |

## Outputs

| Name                                                                                                                    | Description                |
| ----------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| <a name="output_s3_bucket_ownership_controls"></a> [s3_bucket_ownership_controls](#output_s3_bucket_ownership_controls) | Amazon S3 Bucket resource. |

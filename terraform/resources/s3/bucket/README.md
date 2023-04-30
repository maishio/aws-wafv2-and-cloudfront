# Amazon S3 Bucket Terraform Resource

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

| Name                                                                                                        | Type     |
| ----------------------------------------------------------------------------------------------------------- | -------- |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name                                                                     | Description                                                                                                             | Type          | Default | Required |
| ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket)                      | Name of the bucket.                                                                                                     | `string`      | n/a     |   yes    |
| <a name="input_force_destroy"></a> [force_destroy](#input_force_destroy) | Boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. | `bool`        | `false` |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                            | A mapping of tags to assign to the resource.                                                                            | `map(string)` | `{}`    |    no    |

## Outputs

| Name                                                           | Description                |
| -------------------------------------------------------------- | -------------------------- |
| <a name="output_s3_bucket"></a> [s3_bucket](#output_s3_bucket) | Amazon S3 Bucket resource. |

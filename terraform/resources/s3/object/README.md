# Amazon S3 Object Terraform Resource

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
| [aws_s3_object.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |

## Inputs

| Name                                                                  | Description                                                                        | Type          | Default                      | Required |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ------------- | ---------------------------- | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket)                   | Name of the bucket.                                                                | `string`      | n/a                          |   yes    |
| <a name="input_content_type"></a> [content_type](#input_content_type) | Standard MIME type describing the format of the object data.                       | `string`      | `"application/octet-stream"` |    no    |
| <a name="input_key"></a> [key](#input_key)                            | Name of the object once it is in the bucket.                                       | `string`      | n/a                          |   yes    |
| <a name="input_path"></a> [path](#input_path)                         | Path to a file that will be read and uploaded as raw bytes for the object content. | `string`      | `null`                       |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                         | A mapping of tags to assign to the resource.                                       | `map(string)` | `{}`                         |    no    |

## Outputs

| Name                                                           | Description                |
| -------------------------------------------------------------- | -------------------------- |
| <a name="output_s3_object"></a> [s3_object](#output_s3_object) | Amazon S3 Object resource. |

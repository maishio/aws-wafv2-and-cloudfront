# Amazon ECR Terraform Resource

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
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository)             | resource |

## Inputs

| Name                                                                                          | Description                                                                                      | Type          | Default     | Required |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------------- | ----------- | :------: |
| <a name="input_force_delete"></a> [force_delete](#input_force_delete)                         | If true, will delete the repository even if it contains images.                                  | `bool`        | `false`     |    no    |
| <a name="input_image_tag_mutability"></a> [image_tag_mutability](#input_image_tag_mutability) | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE.             | `string`      | `"MUTABLE"` |    no    |
| <a name="input_name"></a> [name](#input_name)                                                 | Name of the repository.                                                                          | `string`      | n/a         |   yes    |
| <a name="input_path"></a> [path](#input_path)                                                 | Path to the lifecycle policy template.                                                           | `string`      | n/a         |   yes    |
| <a name="input_scan_on_push"></a> [scan_on_push](#input_scan_on_push)                         | Indicates whether images are scanned after being pushed to the repository (true) or not (false). | `bool`        | `true`      |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                 | A mapping of tags to assign to the resource.                                                     | `map(string)` | `{}`        |    no    |
| <a name="input_vars"></a> [vars](#input_vars)                                                 | Variables to pass to the lifecycle policy template.                                              | `map(string)` | `{}`        |    no    |

## Outputs

| Name                                                                          | Description |
| ----------------------------------------------------------------------------- | ----------- |
| <a name="output_ecr_repository"></a> [ecr_repository](#output_ecr_repository) | n/a         |

## Usage

Create a json file defined the ecr lifecycle policy.(file name: ecr_lifecycle_policy.json)

```json
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Expire images leaving the latest one",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 2
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
```

Create a terraform file to create ecr repository and lifecycle policy.

```hcl
module "ecr" {
  source = "git::https://github.com/maishio/terraform-aws-resources.git//ecr"
  name   = "${var.tags.service}-${var.tags.env}-ecr"
  path   = "${path.module}/files/template/ecr_lifecycle_policy.json"
  tags   = var.tags
}
```

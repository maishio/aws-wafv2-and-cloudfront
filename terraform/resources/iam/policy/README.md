# AWS IAM Policy Terraform Resource

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

| Name                                                                                                                                          | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                 | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name                                                                                                                                 | Description                                       | Type          | Default | Required |
| ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_create_iam_role_policy_attachment"></a> [create_iam_role_policy_attachment](#input_create_iam_role_policy_attachment) | Whether to create the IAM role policy attachment. | `bool`        | `false` |    no    |
| <a name="input_description"></a> [description](#input_description)                                                                   | Description of the policy.                        | `string`      | `null`  |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                                        | Name of the policy.                               | `string`      | `null`  |    no    |
| <a name="input_path"></a> [path](#input_path)                                                                                        | Path to the policy.                               | `string`      | `null`  |    no    |
| <a name="input_role"></a> [role](#input_role)                                                                                        | Name of the IAM role to attach the policy to.     | `string`      | `null`  |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                                        | A mapping of tags to assign to the resource.      | `map(string)` | `{}`    |    no    |
| <a name="input_vars"></a> [vars](#input_vars)                                                                                        | Variables to be used in the policy.               | `map(string)` | `{}`    |    no    |

## Outputs

| Name                                                              | Description |
| ----------------------------------------------------------------- | ----------- |
| <a name="output_iam_policy"></a> [iam_policy](#output_iam_policy) | n/a         |

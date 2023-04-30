# AWS WAFv2 Web ACL Association Terraform Resource

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

| Name                                                                                                                                        | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_wafv2_web_acl_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) | resource |

## Inputs

| Name                                                                  | Description                                                                                 | Type     | Default | Required |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | -------- | ------- | :------: |
| <a name="input_resource_arn"></a> [resource_arn](#input_resource_arn) | The Amazon Resource Name (ARN) of the resource to associate with the web ACL.               | `string` | n/a     |   yes    |
| <a name="input_web_acl_arn"></a> [web_acl_arn](#input_web_acl_arn)    | The Amazon Resource Name (ARN) of the web ACL that you want to associate with the resource. | `string` | n/a     |   yes    |

## Outputs

| Name                                                                                                           | Description                             |
| -------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| <a name="output_wafv2_web_acl_association"></a> [wafv2_web_acl_association](#output_wafv2_web_acl_association) | AWS WAFv2 Web ACL Association resource. |

# ELB (Elastic Load Balancing) Listener Terraform Resource

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

| Name                                                                                                            | Type     |
| --------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

## Inputs

| Name                                                                                 | Description                                                 | Type          | Default | Required |
| ------------------------------------------------------------------------------------ | ----------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_certificate_arn"></a> [certificate_arn](#input_certificate_arn)       | ARN of the default SSL server certificate.                  | `string`      | `null`  |    no    |
| <a name="input_default_action"></a> [default_action](#input_default_action)          | A list of default action objects for the dynamic block.     | `list(any)`   | `[]`    |    no    |
| <a name="input_load_balancer_arn"></a> [load_balancer_arn](#input_load_balancer_arn) | ARN of the load balancer.                                   | `string`      | n/a     |   yes    |
| <a name="input_name"></a> [name](#input_name)                                        | The name of the listener.                                   | `string`      | n/a     |   yes    |
| <a name="input_port"></a> [port](#input_port)                                        | Port on which the load balancer is listening.               | `string`      | `null`  |    no    |
| <a name="input_protocol"></a> [protocol](#input_protocol)                            | Protocol for connections from clients to the load balancer. | `string`      | `null`  |    no    |
| <a name="input_ssl_policy"></a> [ssl_policy](#input_ssl_policy)                      | Name of the SSL Policy for the listener.                    | `string`      | `null`  |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                        | A map of tags to assign to the resource.                    | `map(string)` | `{}`    |    no    |

## Outputs

| Name                                                                    | Description |
| ----------------------------------------------------------------------- | ----------- |
| <a name="output_elb_listener"></a> [elb_listener](#output_elb_listener) | n/a         |

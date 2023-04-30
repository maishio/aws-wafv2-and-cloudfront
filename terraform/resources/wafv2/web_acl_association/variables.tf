# AWS WAFv2 Web ACL Association
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association

variable "resource_arn" {
  description = "The Amazon Resource Name (ARN) of the resource to associate with the web ACL."
  type        = string
}

variable "web_acl_arn" {
  description = "The Amazon Resource Name (ARN) of the web ACL that you want to associate with the resource."
  type        = string
}

# AWS WAFv2 Web ACL Association
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association

resource "aws_wafv2_web_acl_association" "this" {
  resource_arn = var.resource_arn
  web_acl_arn  = var.web_acl_arn
}

# --------------------------------------------------------------------------------
# AWS WAFv2 WEB ACL Logging Configuration アウトプット定義
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration
# --------------------------------------------------------------------------------

output "wafv2_web_acl_logging_configuration" {
  value = aws_wafv2_web_acl_logging_configuration.this
}
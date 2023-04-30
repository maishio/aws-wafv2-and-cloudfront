# AWS WAFv2 WEB ACL Logging Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration

resource "aws_wafv2_web_acl_logging_configuration" "this" {
  log_destination_configs = var.log_destination_configs
  resource_arn            = var.resource_arn
}

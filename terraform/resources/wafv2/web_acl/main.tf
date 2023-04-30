# AWS WAFv2 Web ACL
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl

resource "aws_wafv2_web_acl" "this" {
  description = var.description
  name        = var.name
  scope       = var.scope
  tags        = merge(var.tags, { "Name" = var.name })

  default_action {
    allow {}
  }

  dynamic "rule" {
    for_each = var.rule
    content {
      name     = rule.value.name
      priority = rule.value.priority

      override_action {
        dynamic "none" {
          for_each = lookup(rule.value, "override_action", {}) == "none" ? [1] : []
          content {}
        }

        dynamic "count" {
          for_each = lookup(rule.value, "override_action", {}) == "count" ? [1] : []
          content {}
        }
      }

      statement {
        dynamic "managed_rule_group_statement" {
          for_each = rule.value.managed_rule_group_statement
          content {
            name        = managed_rule_group_statement.value.name
            vendor_name = managed_rule_group_statement.value.vendor_name
          }
        }
      }

      dynamic "visibility_config" {
        for_each = rule.value.visibility_config
        content {
          cloudwatch_metrics_enabled = visibility_config.value.cloudwatch_metrics_enabled
          metric_name                = visibility_config.value.metric_name
          sampled_requests_enabled   = visibility_config.value.sampled_requests_enabled
        }
      }
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
    metric_name                = var.metric_name
    sampled_requests_enabled   = var.sampled_requests_enabled
  }
}

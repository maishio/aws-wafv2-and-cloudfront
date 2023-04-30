module "wafv2" {
  source      = "../../resources/wafv2/web_acl"
  description = "AWS WAFv2 Web ACL for ALB"
  name        = "${var.tags.service}-${var.tags.env}-alb-waf"
  scope       = "REGIONAL"
  tags        = var.tags

  /* Rule Block */

  rule = [
    {
      name            = "AWSManagedRulesCommonRuleSet"
      override_action = "none"
      priority        = 10
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesCommonRuleSet"
          vendor_name = "AWS"
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesCommonRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name            = "AWSManagedRulesKnownBadInputsRuleSet"
      override_action = "none"
      priority        = 20
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesKnownBadInputsRuleSet"
          vendor_name = "AWS"
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesKnownBadInputsRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name            = "AWSManagedRulesAmazonIpReputationList"
      override_action = "none"
      priority        = 30
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesAmazonIpReputationList"
          vendor_name = "AWS"
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesAmazonIpReputationListMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name            = "AWSManagedRulesAnonymousIpList"
      override_action = "none"
      priority        = 40
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesAnonymousIpList"
          vendor_name = "AWS"
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesAnonymousIpListMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name            = "AWSManagedRulesSQLiRuleSet"
      override_action = "none"
      priority        = 50
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesSQLiRuleSet"
          vendor_name = "AWS"
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesSQLiRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name            = "AWSManagedRulesLinuxRuleSet"
      override_action = "none"
      priority        = 60
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesLinuxRuleSet"
          vendor_name = "AWS"
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesLinuxRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name            = "AWSManagedRulesUnixRuleSet"
      override_action = "none"
      priority        = 70
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesUnixRuleSet"
          vendor_name = "AWS"
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesUnixRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
  ]

  /* Visibility Configuration Block */

  cloudwatch_metrics_enabled = true
  metric_name                = "${var.tags.service}-${var.tags.env}-alb-waf"
  sampled_requests_enabled   = false
}

module "wafv2_association" {
  source       = "../../resources/wafv2/web_acl_association"
  resource_arn = module.alb.elb.arn
  web_acl_arn  = module.wafv2.wafv2_web_acl.arn
}

module "wafv2_logging" {
  source                  = "../../resources/wafv2/web_acl_logging_configuration"
  log_destination_configs = [module.waf_logs.s3_bucket.arn]
  resource_arn            = module.wafv2.wafv2_web_acl.arn

}

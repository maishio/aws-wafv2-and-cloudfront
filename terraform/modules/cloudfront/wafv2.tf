module "wafv2" {
  source      = "../../resources/wafv2/web_acl"
  description = "AWS WAFv2 Web ACL for CloudFront"
  name        = "${var.tags.service}-${var.tags.env}-cloudfront-waf"
  scope       = "CLOUDFRONT"
  tags        = var.tags

  /* Rule Block */

  rule = [
    {
      name     = "AWSManagedRulesCommonRuleSet"
      priority = 10
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesCommonRuleSet"
          vendor_name = "AWS"
        }
      ]
      rate_based_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesCommonRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesKnownBadInputsRuleSet"
      priority = 20
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesKnownBadInputsRuleSet"
          vendor_name = "AWS"
        }
      ]
      rate_based_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesKnownBadInputsRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesAmazonIpReputationList"
      priority = 30
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesAmazonIpReputationList"
          vendor_name = "AWS"
        }
      ]
      rate_based_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesAmazonIpReputationListMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesAnonymousIpList"
      priority = 40
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesAnonymousIpList"
          vendor_name = "AWS"
        }
      ]
      rate_based_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesAnonymousIpListMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesSQLiRuleSet"
      priority = 50
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesSQLiRuleSet"
          vendor_name = "AWS"
        }
      ]
      rate_based_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesSQLiRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesLinuxRuleSet"
      priority = 60
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesLinuxRuleSet"
          vendor_name = "AWS"
        }
      ]
      rate_based_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesLinuxRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSManagedRulesUnixRuleSet"
      priority = 70
      action   = []
      override_action = [
        {
          type = "none"
        }
      ]
      managed_rule_group_statement = [
        {
          name        = "AWSManagedRulesUnixRuleSet"
          vendor_name = "AWS"
        }
      ]
      rate_based_statement = []
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSManagedRulesUnixRuleSetMetric"
          sampled_requests_enabled   = false
        }
      ]
    },
    {
      name     = "AWSRateBasedRule"
      priority = 1
      action = [
        {
          type = "block"
        }
      ]
      override_action              = []
      managed_rule_group_statement = []
      rate_based_statement = [
        {
          aggregate_key_type = "IP"
          limit              = 500
          geo_match_statement = [
            {
              country_codes = ["US", "NL"]
            }
          ]
        }
      ]
      visibility_config = [
        {
          cloudwatch_metrics_enabled = true
          metric_name                = "AWSRateBasedRuleMetric"
          sampled_requests_enabled   = false
        }
      ]
    }
  ]

  /* Visibility Configuration Block */

  cloudwatch_metrics_enabled = true
  metric_name                = "${var.tags.service}-${var.tags.env}-cloudfront-waf"
  sampled_requests_enabled   = false
}

module "wafv2_logging" {
  source                  = "../../resources/wafv2/web_acl_logging_configuration"
  log_destination_configs = [module.waf_logs.s3_bucket.arn]
  resource_arn            = module.wafv2.wafv2_web_acl.arn

}

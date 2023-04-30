# AWS WAFv2 Web ACL
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl

/* Top-level Arguments */

variable "description" {
  description = "Description of the Web ACL."
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the Web ACL."
  type        = string
}

variable "scope" {
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application."
  type        = string
}

variable "tags" {
  description = "Map of key-value pairs to associate with the resource."
  type        = map(string)
  default     = {}
}

/* Rule Arguments */

variable "rule" {
  description = "Dynamic block for the rule."
  type        = list(any)
  default     = []
}

/* Visibility Configuration Arguments */

variable "cloudwatch_metrics_enabled" {
  description = "Whether the associated resource sends metrics to CloudWatch."
  type        = bool
  default     = false
}

variable "metric_name" {
  description = "Name of the CloudWatch metric."
  type        = string
  default     = null
}

variable "sampled_requests_enabled" {
  description = "Whether AWS WAF should store a sampling of the web requests that match the rules."
  type        = bool
  default     = false
}

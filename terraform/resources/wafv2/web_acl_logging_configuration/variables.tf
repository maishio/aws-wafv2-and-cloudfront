# AWS WAFv2 WEB ACL Logging Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration

variable "log_destination_configs" {
  description = "Amazon Kinesis Data Firehose, Cloudwatch Log log group, or S3 bucket Amazon Resource Names (ARNs) that you want to associate with the web ACL."
  type        = list(string)
}

variable "resource_arn" {
  description = "ARN of the resource to associate with the web ACL."
  type        = string
}

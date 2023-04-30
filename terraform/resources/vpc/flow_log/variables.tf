# Amazon VPC Flow Log
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log

variable "eni_id" {
  description = "Elastic Network Interface ID."
  type        = string
  default     = null
}

variable "iam_role_arn" {
  description = "ARN of the IAM role that posts logs to CloudWatch Logs."
  type        = string
  default     = null
}

variable "log_destination" {
  description = "ARN of the logging destination."
  type        = string
  default     = null
}

variable "log_destination_type" {
  description = "Type of the logging destination."
  type        = string
  default     = "cloud-watch-logs"
}

variable "log_group_name" {
  description = "Name of the CloudWatch log group."
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the flow log."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "transit_gateway_attachment_id" {
  description = "Transit Gateway Attachment ID."
  type        = string
  default     = null
}

variable "transit_gateway_id" {
  description = "Transit Gateway ID."
  type        = string
  default     = null
}

variable "traffic_type" {
  description = "Type of traffic to capture."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
  default     = null
}

/* destination_options block */
variable "file_format" {
  description = "Format for the flow log."
  type        = string
  default     = "plain-text"
}

variable "hive_compatible_partitions" {
  description = "Indicates whether to create Hive-compatible partitions."
  type        = bool
  default     = false
}

variable "per_hour_partition" {
  description = "Indicates whether to create a new partition every hour."
  type        = bool
  default     = false
}

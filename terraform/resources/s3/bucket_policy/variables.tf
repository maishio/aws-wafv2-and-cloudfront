# Amazon S3 Bucket Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy

variable "bucket" {
  description = "Name of the bucket."
  type        = string
}

variable "path" {
  description = "Path to the policy document."
  type        = string
  default     = null
}

variable "vars" {
  description = "Variables to pass to the policy document."
  type        = map(string)
  default     = {}
}

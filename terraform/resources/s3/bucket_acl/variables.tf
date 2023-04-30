# Amazon S3 Bucket ACL
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl

variable "bucket" {
  description = "Name of the bucket."
  type        = string
}

variable "access_control_policy" {
  description = "Dynamic block for access control policy."
  type        = list(any)
  default     = []
}

variable "acl" {
  description = "Canned ACL to apply to the bucket."
  type        = string
  default     = null
}

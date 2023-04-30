# Amazon S3 Bucket Versioning
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning

variable "bucket" {
  description = "Name of the bucket."
  type        = string
}

variable "status" {
  description = "Versioning state of the bucket. Valid values are `Enabled`, `Suspended`, or `Disabled`."
  type        = string
  default     = "Disabled"
}

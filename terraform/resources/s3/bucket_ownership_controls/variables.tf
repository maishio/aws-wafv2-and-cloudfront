# Amazon S3 Bucket Ownership Controls
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls

variable "bucket" {
  description = "Name of the bucket."
  type        = string
}

variable "object_ownership" {
  description = "Object ownership."
  type        = string
}

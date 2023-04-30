# Amazon S3 Bucket Lifecycle Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration

variable "bucket" {
  description = "Name of the bucket."
  type        = string
}

variable "rule" {
  description = "Dynamic block for create the lifecycle rules."
  type        = list(any)
  default     = []
}

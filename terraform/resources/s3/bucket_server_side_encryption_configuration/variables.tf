# Amazon S3 Bucket Server Side Encryption Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration

variable "bucket" {
  description = "Name of the bucket."
  type        = string
}

variable "bucket_key_enabled" {
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "AWS KMS master key ID used for the SSE-KMS encryption."
  type        = string
  default     = null
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`."
  type        = string
  default     = "AES256"
}

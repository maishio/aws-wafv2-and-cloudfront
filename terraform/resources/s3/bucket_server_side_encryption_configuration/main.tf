# Amazon S3 Bucket Server Side Encryption Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = var.bucket

  rule {
    bucket_key_enabled = var.bucket_key_enabled

    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_master_key_id
      sse_algorithm     = var.sse_algorithm
    }
  }
}

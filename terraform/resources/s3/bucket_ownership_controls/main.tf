# Amazon S3 Bucket Ownership Controls
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = var.bucket

  rule {
    object_ownership = var.object_ownership
  }
}

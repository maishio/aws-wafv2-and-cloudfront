# Amazon S3 Bucket Versioning
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning

resource "aws_s3_bucket_versioning" "this" {
  bucket = var.bucket

  versioning_configuration {
    status = var.status
  }
}

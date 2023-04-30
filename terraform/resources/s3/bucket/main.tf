# Amazon S3 Bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "this" {
  bucket        = var.bucket
  force_destroy = var.force_destroy
  tags          = merge(var.tags, { "Name" = var.bucket })
}

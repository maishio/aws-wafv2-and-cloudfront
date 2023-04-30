# Amazon S3 Bucket Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy

resource "aws_s3_bucket_policy" "this" {
  bucket = var.bucket
  policy = templatefile(var.path, var.vars)
}

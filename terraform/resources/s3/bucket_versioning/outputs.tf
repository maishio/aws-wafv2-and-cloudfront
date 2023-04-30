# Amazon S3 Bucket Versioning
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning

output "s3_bucket_versioning" {
  description = "Amazon S3 Bucket Versioning resource."
  value       = aws_s3_bucket_versioning.this
}

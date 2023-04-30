# Amazon S3 Bucket ACL
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl

output "s3_bucket_acl" {
  description = "Amazon S3 Bucket ACL resource."
  value       = aws_s3_bucket_acl.this
}

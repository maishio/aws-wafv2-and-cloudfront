# Amazon S3 Bucket Server Side Encryption Configuration
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration

output "s3_bucket_server_side_encryption_configuration" {
  description = "Amazon S3 Bucket resource."
  value       = aws_s3_bucket_server_side_encryption_configuration.this
}

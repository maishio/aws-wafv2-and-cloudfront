# Amazon S3 Bucket ACL
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl

resource "aws_s3_bucket_acl" "this" {
  bucket = var.bucket
  acl    = var.access_control_policy == [] ? var.acl : null

  dynamic "access_control_policy" {
    for_each = var.access_control_policy
    content {

      dynamic "grant" {
        for_each = access_control_policy.value.grant
        content {
          grantee {
            id   = grant.value.id
            type = grant.value.type
          }
          permission = grant.value.permission
        }
      }

      owner {
        id = access_control_policy.value.id
      }
    }
  }
}

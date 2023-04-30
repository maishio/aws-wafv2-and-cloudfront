# Amazon CloudFront Origin Access Identity
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity

variable "comment" {
  description = "An optional comment for the origin access identity."
  type        = string
  default     = "Managed by Terraform"
}

# Amazon CloudFront Origin Access Control
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control

variable "name" {
  description = "Name of the Origin Access Control."
  type        = string
}

variable "description" {
  description = "Description of the Origin Access Control."
  type        = string
  default     = "Managed by Terraform"
}

variable "origin_access_control_origin_type" {
  description = "Type of origin that this Origin Access Control is for.."
  type        = string
}

variable "signing_behavior" {
  description = "Specifies which requests CloudFront signs. "
  type        = string
}

variable "signing_protocol" {
  description = "Determines how CloudFront signs (authenticates) requests."
  type        = string
}

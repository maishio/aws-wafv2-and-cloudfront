# Amazon CloudFront Response Header Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy

variable "comment" {
  description = "Comment to describe the response headers policy."
  type        = string
  default     = "Managed by Terraform"
}

variable "name" {
  description = "Name of the response headers policy."
  type        = string
}

variable "cors_config" {
  description = "Dynamic block defining the CORS configuration."
  type        = list(any)
  default     = []
}

variable "custom_headers_config" {
  description = "Dynamic block defining the custom headers configuration."
  type        = list(any)
  default     = []
}

variable "server_timing_headers_config" {
  description = "Dynamic block defining the server timing headers configuration."
  type        = list(any)
  default     = []
}

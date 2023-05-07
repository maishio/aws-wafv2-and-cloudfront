# Amazon S3 Object
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object

variable "bucket" {
  description = "Name of the bucket."
  type        = string
}

variable "objects" {
  description = "A map of objects to create in the bucket."
  type        = any
  default     = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

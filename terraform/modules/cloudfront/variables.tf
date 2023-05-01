variable "account" {
  description = "AWS Account ID."
  type        = map(string)
}

variable "alb_id" {
  description = "ID of the ALB."
  type        = string
}

variable "hostzone" {
  description = "A map of Route53 Hosted Zone to create the DNS record in."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

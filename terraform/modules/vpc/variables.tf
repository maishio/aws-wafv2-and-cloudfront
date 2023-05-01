variable "account" {
  description = "AWS Account ID."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

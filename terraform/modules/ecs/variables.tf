variable "region" {
  description = "AWS Region ID."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the ALB."
  type        = list(string)
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the ALB."
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC to create the ALB in."
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN to attach to the ECS service."
  type        = string
}

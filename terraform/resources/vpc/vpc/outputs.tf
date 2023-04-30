# Amazon VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

output "vpc" {
  description = "Amazon VPC resource."
  value       = aws_vpc.this
}

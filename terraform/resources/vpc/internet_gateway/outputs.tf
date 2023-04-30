# Amazon VPC Internet Gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

output "internet_gateway" {
  description = "Amazon VPC Internet Gateway resource."
  value       = aws_internet_gateway.this
}

output "alb_id" {
  description = "ID of the ALB."
  value       = module.alb.elb.id
}

output "alb_dns_name" {
  description = "DNS name of the ALB."
  value       = module.alb.elb.dns_name
}

output "alb_target_group_arn" {
  description = "ARN of the ALB target group."
  value       = module.target_group.elb_target_group.arn
}

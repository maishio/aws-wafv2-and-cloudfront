output "alb_id" {
  description = "ID of the ALB."
  value       = module.alb.elb.id
}

output "alb_target_group_arn" {
  description = "ARN of the ALB target group."
  value       = module.target_group.elb_target_group.arn
}

output "alb_logs_bucket_id" {
  description = "ID of the ALB log bucket."
  value       = module.alb_logs.s3_bucket.id
}

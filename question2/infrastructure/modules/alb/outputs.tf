output alb_security_group_id {
  value = module.alb.security_group_id
  description = "The ID of the security group for the ALB"
}

output alb_target_group_http_arn {
  value = module.alb.target_groups.http.arn
  description = "The ARN of the HTTP target group"
}

output alb_dns_name {
  value = module.alb.dns_name
  description = "The DNS name of the ALB"
}

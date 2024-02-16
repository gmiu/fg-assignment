output rds_address {
  value = module.rds.db_instance_address
  description = "The address of the RDS instance"
}

output rds_endpoint {
  value = module.rds.db_instance_endpoint
  description = "The endpoint of the RDS instance"
}

output rds_security_group_id {
  value = module.rds_sg.security_group_id
  description = "The ID of the security group for the RDS instance"
}

output rds_master_user_secret_arn {
  value = module.rds.db_instance_master_user_secret_arn
  description = "The ARN of the secret for the master user of the RDS instance"
}

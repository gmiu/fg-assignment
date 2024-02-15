output "rds_instance_address" {
  value = module.rds.db_instance_address
}

output "rds_instance_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "rds_security_group_id" {
  value = module.rds-sg.security_group_id
}

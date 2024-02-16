output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}


output "public_subnet_ids" {
  value       = module.vpc.public_subnets
  description = "The list of the public subnets IDs"
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnets
  description = "The list of the private subnets IDs"
}

output "database_subnet_group" {
  value       = module.vpc.database_subnet_group
  description = "The database subnet group name"
}

output "private_subnets_cidr" {
  value       = module.vpc.private_subnets_cidr_blocks
  description = "The list of the private subnets CIDR blocks"
}

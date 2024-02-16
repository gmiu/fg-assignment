data "aws_availability_zones" "available" {}

locals {
  cidr_block = "10.0.0.0/24"
  az_count   = 2
  azs        = slice(data.aws_availability_zones.available.names, 0, local.az_count)
}

# Create the VPC
module "fg_vpc" {
  source = "./modules/vpc"

  vpc_name = "fg-vpc"

  cidr_block = local.cidr_block
  az_count   = local.az_count

  public_subnets   = [for k, v in local.azs : cidrsubnet(local.cidr_block, 3, k)]
  private_subnets  = [for k, v in local.azs : cidrsubnet(local.cidr_block, 3, k + 2)]
  database_subnets = [for k, v in local.azs : cidrsubnet(local.cidr_block, 3, k + 4)]
}

# Create the bastion host
module "fg_bastion" {
  source = "./modules/bastion"

  bastion_name     = "fg-bastion"
  bastion_key_name = "simple-ec2-key"

  bastion_vpc_id    = module.fg_vpc.vpc_id
  bastion_subnet_id = module.fg_vpc.public_subnet_ids[0]

  ssh_allow_cidr_blocks = "188.26.90.200/32"
}

output "fg_bastion_public_ip" {
  value       = module.fg_bastion.bastion_public_ip
  description = "The public IP of the bastion host"
}

# Create the RDS MySQL DB
module "fg_database" {
  source = "./modules/rds"

  rds_identifier = "fg-db"

  rds_db_name     = "fgdb"
  rds_db_username = "admin"

  rds_vpc_id               = module.fg_vpc.vpc_id
  rds_db_subnet_group_name = module.fg_vpc.database_subnet_group
}

output "fg_database_endpoint" {
  value       = module.fg_database.rds_endpoint
  description = "The endpoint of the RDS MySQL DB"
}

output "fg_database_address" {
  value       = module.fg_database.rds_address
  description = "The address of the RDS MySQL DB"
}

output "fg_database_master_user_secret_arn" {
  value       = module.fg_database.rds_master_user_secret_arn
  description = "The ARN of the secret containing the master user credentials for the RDS MySQL DB"
}

# Create the ALB
module "fg_alb" {
  source = "./modules/alb"

  alb_name = "fg-alb"

  alb_vpc_id     = module.fg_vpc.vpc_id
  alb_subnet_ids = module.fg_vpc.public_subnet_ids

  alb_enable_deletion_protection = false
  alb_enable_tls                 = false
}

output "fg_alb_dns_name" {
  value       = module.fg_alb.alb_dns_name
  description = "The DNS name of the ALB"
}

output "fg_alb_target_group_http_arn" {
  value       = module.fg_alb.alb_target_group_http_arn
  description = "The ARN of the target group for the HTTP listener"
}

# Create the web servers
module "fg_webserver" {
  source = "./modules/webserver"

  webserver_name     = "fg-webserver"
  webserver_key_name = "simple-ec2-key"

  webserver_vpc_id     = module.fg_vpc.vpc_id
  webserver_subnet_ids = module.fg_vpc.private_subnet_ids

  http_target_group_arn = module.fg_alb.alb_target_group_http_arn

  bastion_security_group_id = module.fg_bastion.bastion_security_group_id
  alb_security_group_id     = module.fg_alb.alb_security_group_id
  rds_security_group_id     = module.fg_database.rds_security_group_id
}

output "fg_webserver_private_ips" {
  value       = module.fg_webserver.webserver_private_ips
  description = "The private IPs of the web servers"
}

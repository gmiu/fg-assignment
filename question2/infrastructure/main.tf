data "aws_availability_zones" "available" {}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)
}

# Create the VPC
module "fg_vpc" {
  source = "./modules/vpc"

  vpc_name = "fg-vpc"

  cidr_block = var.vpc_cidr_block
  az_count   = var.az_count

  # Split the VPC CIDR into /27s for the public, private, and database subnets
  # Should be improved to accomodate more than 2 AZs per subnet
  public_subnets   = [for k, v in local.azs : cidrsubnet(var.vpc_cidr_block, 3, k)]
  private_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr_block, 3, k + 2)]
  database_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr_block, 3, k + 4)]
}

# Create the bastion host
module "fg_bastion" {
  source = "./modules/bastion"

  bastion_name     = "fg-bastion"
  bastion_key_name = var.bastion_key_name

  bastion_vpc_id    = module.fg_vpc.vpc_id
  bastion_subnet_id = module.fg_vpc.public_subnet_ids[0]

  ssh_allow_cidr_blocks = var.bastion_ssh_allow_cidr_blocks
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

  bastion_security_group_id = module.fg_bastion.bastion_security_group_id
}

output "fg_database_address" {
  value       = module.fg_database.rds_address
  description = "The address of the RDS MySQL DB"
}

output "fg_database_endpoint" {
  value       = module.fg_database.rds_address
  description = "The endpoint of the RDS MySQL DB"
}


output "fg_database_master_user_secret_arn" {
  value       = module.fg_database.rds_master_user_secret_arn
  description = "The ARN of the secret containing the master user credentials for the RDS MySQL DB"
}

data "aws_secretsmanager_secret" "fg_database_master_user_secret" {
  arn = module.fg_database.rds_master_user_secret_arn
}

output "fg_database_master_user_secret_name" {
  value = data.aws_secretsmanager_secret.fg_database_master_user_secret.name
}


# Create the ALB
module "fg_alb" {
  source = "./modules/alb"

  alb_name = "fg-alb"

  alb_vpc_id     = module.fg_vpc.vpc_id
  alb_subnet_ids = module.fg_vpc.public_subnet_ids

  alb_enable_deletion_protection = var.alb_enable_deletion_protection
  alb_enable_tls                 = var.alb_enable_tls

  alb_certificate_arn = var.alb_certificate_arn

  route53_zone   = var.alb_r53_dns_zone
  route53_record = var.alb_r53_dns_name

  backend_port = var.backend_webserver_port
  target_type  = var.alb_target_type
}

output "fg_alb_dns_name" {
  value       = module.fg_alb.alb_dns_name
  description = "The DNS name of the ALB"
}

output "fg_dns_endpoint" {
  value       = var.alb_r53_dns_name == "" ? module.fg_alb.alb_dns_name : var.alb_r53_dns_name
  description = "The DNS endpoint of the ALB"

}

data "aws_secretsmanager_secret_version" "fg_database_master_user_secret" {
  secret_id = module.fg_database.rds_master_user_secret_arn
}

module "fg_ecs" {
  source = "./modules/ecs"

  cluster_name          = "fg-ecs"
  service_name          = "fg-test-app"
  subnet_ids            = module.fg_vpc.private_subnet_ids
  alb_security_group_id = module.fg_alb.alb_security_group_id
  http_target_group_arn = module.fg_alb.alb_target_group_http_arn
  http_port             = var.backend_webserver_port

  db_host = module.fg_database.rds_address
  db_name = module.fg_database.rds_db_name
  db_user = module.fg_database.rds_username
  # TODO make secret retrieval more secure instead of passing the secret name
  # secret can be seen in clear in the task definition JSON in the console
  # attach IAM policy to the task role to allow it to retrieve the secret
  db_pass = jsondecode(data.aws_secretsmanager_secret_version.fg_database_master_user_secret.secret_string)["password"]
}

# # Create the web servers
# module "fg_webserver" {
#   source = "./modules/webserver"

#   webserver_name     = "fg-webserver"
#   webserver_key_name = var.webserver_key_name # "simple-ec2-key"

#   webserver_vpc_id     = module.fg_vpc.vpc_id
#   webserver_subnet_ids = module.fg_vpc.private_subnet_ids

#   http_target_group_arn = module.fg_alb.alb_target_group_http_arn
#   http_port             = var.backend_webserver_port

#   bastion_security_group_id = module.fg_bastion.bastion_security_group_id
#   alb_security_group_id     = module.fg_alb.alb_security_group_id
#   rds_security_group_id     = module.fg_database.rds_security_group_id
# }

# output "fg_webserver_private_ips" {
#   value       = module.fg_webserver.webserver_private_ips
#   description = "The private IPs of the web servers"
# }


# resource local_file group_vars {
#   filename             = "${path.module}/../ansible/group_vars/all/from_terraform.yaml"
#   content = templatefile("${path.module}/templates/group_vars.tpl", {
#     rds_host = module.fg_database.rds_address
#     rds_db = module.fg_database.rds_db_name
#     rds_user = module.fg_database.rds_username
#     rds_pass_secret_name = data.aws_secretsmanager_secret.fg_database_master_user_secret.name
#   })
# }

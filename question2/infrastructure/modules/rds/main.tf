module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier = var.rds_identifier

  create_db_option_group    = false
  create_db_parameter_group = false

  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  family               = var.rds_db_family
  major_engine_version = var.rds_major_engine_version
  instance_class       = var.rds_instance_class

  allocated_storage = var.rds_allocated_storage

  db_name  = var.rds_db_name
  username = var.rds_db_username
  port     = var.rds_db_port

  multi_az               = var.rds_multi_az
  db_subnet_group_name   = var.rds_db_subnet_group_name
  vpc_security_group_ids = [module.rds_sg.security_group_id]
}

module "rds_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.rds_identifier}-sg"
  description = "Security group for the RDS instances"
  vpc_id      = var.rds_vpc_id

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "All traffic"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

# allow traffic from bastion for DB admin purposes
resource "aws_security_group_rule" "allow_bastion_on_rds" {
  # count = var.bastion_security_group_id != "" ? 1 : 0

  type                     = "ingress"
  from_port                = var.rds_db_port
  to_port                  = var.rds_db_port
  protocol                 = "tcp"
  security_group_id        = module.rds_sg.security_group_id
  source_security_group_id = var.bastion_security_group_id
}

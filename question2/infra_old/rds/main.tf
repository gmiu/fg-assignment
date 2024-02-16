module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.4.0"

  identifier = "fg-db"

  create_db_option_group    = false
  create_db_parameter_group = false

  engine               = "mysql"
  engine_version       = "8.0"
  family               = "mysql8.0"
  major_engine_version = "8.0"
  instance_class       = "db.t3.micro"

  allocated_storage = 5

  db_name  = "fgdb"
  username = "admin"
  port     = 3306

  multi_az               = false
  db_subnet_group_name   = data.terraform_remote_state.vpc.outputs.database_subnet_group
  vpc_security_group_ids = [module.rds-sg.security_group_id]
}

module "rds-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "fg-db-sg"
  description = "Security group for the RDS instances"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

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

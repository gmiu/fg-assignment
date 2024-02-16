module "webserver" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"
  count   = var.webserver_count

  name = var.webserver_name != "" ? "${var.webserver_name}-${count.index}" : null

  instance_type          = var.webserver_instance_type
  ami                    = var.webserver_ami_id
  key_name               = var.webserver_key_name
  vpc_security_group_ids = [module.webserver_sg.security_group_id]
  subnet_id              = element(var.webserver_subnet_ids, count.index)
}


module "webserver_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = var.webserver_name != "" ? "${var.webserver_name}-sg" : null
  description = "Security group for the webserver instances"
  vpc_id      = var.webserver_vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "SSH traffic"
      source_security_group_id = var.bastion_security_group_id
    },
    {
      from_port                = var.http_port
      to_port                  = var.http_port
      protocol                 = "tcp"
      description              = "ALB HTTP traffic"
      source_security_group_id = var.alb_security_group_id
    },
  ]

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

# allow MySQL traffic from webserver to RDS
resource "aws_security_group_rule" "allow_webserver_on_rds" {
  type                     = "ingress"
  from_port                = var.rds_port
  to_port                  = var.rds_port
  protocol                 = "tcp"
  security_group_id        = var.rds_security_group_id
  source_security_group_id = module.webserver_sg.security_group_id
}

resource "aws_lb_target_group_attachment" "webserver_attachment" {
  count            = var.webserver_count
  target_group_arn = var.http_target_group_arn
  target_id        = module.webserver[count.index].id
  port             = var.http_port
}

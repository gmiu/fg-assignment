locals {
  instance_count = 2
}


module "webserver" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  count   = local.instance_count

  name = "fg-webserver-${count.index}"

  instance_type          = "t2.micro"
  ami                    = "ami-0e731c8a588258d0d"
  key_name               = "simple-ec2-key" # to variables
  vpc_security_group_ids = [module.webserver-sg.security_group_id]
  subnet_id              = element(data.terraform_remote_state.vpc.outputs.private_subnet_ids, count.index)
}


module "webserver-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "fg-webserver-sg"
  description = "Security group for the webserver instances"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "SSH"
      source_security_group_id = data.terraform_remote_state.bastion.outputs.bastion_sg_id
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

resource "aws_lb_target_group" "webserver-tg" {
  name     = "fg-webserver-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_lb_target_group_attachment" "webserver_attachment" {
  count = local.instance_count
  target_group_arn = aws_lb_target_group.webserver-tg.arn
  target_id        = module.webserver[count.index].id
}

resource "aws_security_group_rule" "webserver_allow_lb_traffic" {
  type                     = "ingress"
  to_port                  = 80
  protocol                 = "tcp"
  from_port                = 80
  source_security_group_id = data.terraform_remote_state.alb.outputs.alb.security_group_id
  security_group_id        = module.webserver-sg.security_group_id
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "webserver-https" {
  load_balancer_arn = data.terraform_remote_state.alb.outputs.alb.arn
  port              = "443"
  protocol          = "HTTP"

  # TODO SSL certificate

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webserver-tg.arn
  }
}

resource "aws_security_group_rule" "webserver_allow_rds_traffic" {
  type                     = "ingress"
  to_port                  = 80
  protocol                 = "tcp"
  from_port                = 80
  source_security_group_id = data.terraform_remote_state.rds.outputs.rds_security_group_id
  security_group_id        = module.webserver-sg.security_group_id
  lifecycle {
    create_before_destroy = true
  }
}

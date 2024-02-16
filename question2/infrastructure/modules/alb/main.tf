locals {
  alb_certificate_arn = ""
}


module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name    = var.alb_name
  vpc_id  = var.alb_vpc_id
  subnets = var.alb_subnet_ids

  enable_deletion_protection = var.alb_enable_deletion_protection

  security_group_ingress_rules = {
    all_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "HTTP web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    all_https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "HTTPS web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  listeners = {
    http-https-redirect = {
      port     = 80
      protocol = "HTTP"
      redirect = {
        port        = "443"
        protocol    = "HTTP"
        status_code = "HTTP_301"
      }
    }
    https = {
      port     = 443
      protocol = var.alb_enable_tls ? "HTTPS" : "HTTP"
      certificate_arn = var.alb_enable_tls ? local.alb_certificate_arn : null
      
      forward = {
        target_group_key = "http"
      }
    }
  }

  target_groups = {
    http = {
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      create_attachment = false
    }
  }
}

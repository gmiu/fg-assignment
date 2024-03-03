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
      port            = 443
      protocol        = var.alb_enable_tls ? "HTTPS" : "HTTP"
      certificate_arn = var.alb_enable_tls ? local.alb_certificate_arn : null

      forward = {
        target_group_key = "http_8080"
      }
    }
  }

  target_groups = {
    http_8080 = {
      backend_protocol  = "HTTP"
      port              = var.backend_port
      target_type       = var.target_type
      create_attachment = false
    }
  }
}

locals {
  create_dns             = var.route53_record != "" && var.route53_zone != ""
  create_tls_certificate = var.alb_enable_tls && var.alb_certificate_arn == "" && local.create_dns
  alb_certificate_arn    = local.create_tls_certificate ? module.alb_tls_certificate[0].certificate_arn : var.alb_certificate_arn
}

module "alb_route53_alias" {
  source = "./modules/route53_alias"

  count = local.create_dns ? 1 : 0

  alias_zone_name        = var.route53_zone
  alias_dns_name         = var.route53_record
  target_dns_name        = module.alb.dns_name
  target_zone_id         = module.alb.zone_id
  evaluate_target_health = false
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

module "alb_tls_certificate" {
  source = "./modules/tls"

  count = local.create_tls_certificate ? 1 : 0

  tls_domain_name     = var.route53_record
  tls_route53_zone_id = module.alb_route53_alias[count.index].zone_id
  wait_for_validation = true

  providers = {
    aws = aws.us-east-1
  }
}

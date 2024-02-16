variable "tls_domain_name" {
  type        = string
  description = "The domain name for which the certificate should be issued"
}

variable "tls_route53_zone_id" {
  type        = string
  description = "The Route 53 Hosted Zone ID for which the certificate should be issued"
}

variable "wait_for_validation" {
  type        = bool
  default     = "true"
  description = "Whether to wait for the certificate to be issued and validated"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

module "cert" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 5.0"

  domain_name = var.tls_domain_name
  zone_id     = var.tls_route53_zone_id

  validation_method   = "DNS"
  wait_for_validation = var.wait_for_validation
}

output "certificate_arn" {
  value = module.cert.acm_certificate_arn
}

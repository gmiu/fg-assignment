variable "alias_zone_name" {
  type        = string
  description = "The hosted zone name of the alias record"
}

variable "alias_dns_name" {
  type        = string
  description = "The DNS name of the alias record"
}

variable "target_dns_name" {
  type        = string
  description = "The DNS name of the target to which to point the alias record"
}

variable "target_zone_id" {
  type        = string
  description = "The hosted zone ID of the target to which to point the alias record"
}

variable "evaluate_target_health" {
  type        = bool
  default     = false
  description = "Set to true to evaluate the health of the target"
}

data "aws_route53_zone" "zone" {
  name = var.alias_zone_name
}

resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = var.alias_dns_name
  type    = "A"

  alias {
    name                   = var.target_dns_name
    zone_id                = var.target_zone_id
    evaluate_target_health = false
  }
}

output "zone_id" {
  value = data.aws_route53_zone.zone.zone_id
}

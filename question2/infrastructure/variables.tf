variable "aws_region" {
  type        = string
  description = "The AWS region to deploy to"
}

variable "project_name" {
  type        = string
  default     = "fg-assignment"
  description = "The project name"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/24"
  description = "The CIDR block for the VPC"
}

variable "az_count" {
  type        = number
  default     = 2
  description = "The number of availability zones to deploy to"
}

variable "bastion_key_name" {
  type        = string
  description = "The name of the key pair to use for the bastion host"
}

variable "bastion_ssh_allow_cidr_blocks" {
  type        = string
  default     = "10.0.0.0/24"
  description = "The CIDR blocks to allow SSH access from"
}

variable "alb_r53_dns_name" {
  type        = string
  default     = ""
  description = "The DNS name to use for the ALB"
}

variable "alb_r53_dns_zone" {
  type        = string
  default     = ""
  description = "description"
}

variable "alb_enable_deletion_protection" {
  type        = bool
  default     = false
  description = "Enable deletion protection for the ALB"
}

variable "alb_enable_tls" {
  type        = bool
  default     = false
  description = "Enable TLS for the ALB"
}

variable "alb_certificate_arn" {
  type        = string
  default     = ""
  description = "The ARN of the certificate to use for the ALB"
}


variable "webserver_key_name" {
  type        = string
  description = "The name of the key pair to use for the webserver hosts"
}

variable "backend_webserver_port" {
  type        = number
  default     = 8080
  description = "The port the webserver listens on"
}

variable "alb_target_type" {
  type        = string
  default     = "instance"
  description = "The type of target to use for the ALB"
}

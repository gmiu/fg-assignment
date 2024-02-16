variable "alb_name" {
  type        = string
  description = "The name of the ALB"
}

variable "alb_vpc_id" {
  type        = string
  description = "The VPC ID of the ALB"
}

variable "alb_subnet_ids" {
  type        = list(string)
  description = "The subnet IDs of the ALB"
}

variable "alb_enable_deletion_protection" {
  type        = bool
  default     = false
  description = "If true, deletion of the ALB will be protected"
}

variable "alb_enable_tls" {
  type        = bool
  default     = false
  description = "If true, the ALB will be configured with HTTPS on port 443.\nIf false, the ALB will be configured with HTTP on port 443"
}

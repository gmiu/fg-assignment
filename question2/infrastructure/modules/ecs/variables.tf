variable "cluster_name" {
  type        = string
  description = "The name of the ECS cluster"
}

variable "service_name" {
  type        = string
  description = "The name of the ECS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The subnet IDs to use for the ECS service"
}

variable "http_target_group_arn" {
  type        = string
  description = "The ARN of the HTTP target group"
}

variable "http_port" {
  type        = number
  description = "The port the service listens on"
}

variable "alb_security_group_id" {
  type        = string
  description = "The security group ID of the ALB"
}

variable "db_host" {
  type        = string
  description = "The hostname of the database"
}

variable "db_name" {
  type        = string
  description = "The name of the database"
}

variable "db_user" {
  type        = string
  description = "The username to use to connect to the database"
}

variable "db_pass" {
  type        = string
  sensitive   = true
  description = "The password to use to connect to the database"
}

variable rds_security_group_id {
  type        = string
  description = "The security group ID of the RDS instance"
}

variable "rds_port" {
  type        = number
  default     = 3306
  description = "The port on which the RDS instance listens"
}

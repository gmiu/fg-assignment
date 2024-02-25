variable "webserver_count" {
  type        = number
  default     = 2
  description = "The number of web servers to create"
}

variable "webserver_name" {
  type        = string
  default     = ""
  description = "The name of the web servers"
}

variable "webserver_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type of the web servers"
}

variable "webserver_ami_id" {
  type        = string
  default     = "ami-0440d3b780d96b29d" # Amazon Linux 2023 x86_64 HVM GP2
  description = "The AMI to use for the web servers. Default is Amazon Linux 2023 x86_64 HVM GP2"
}

variable "webserver_key_name" {
  type        = string
  description = "The name of the key pair to use for the web servers"
}

variable "webserver_subnet_ids" {
  type        = list(string)
  description = "The IDs of the subnets in which to place the web servers"
}

variable "webserver_vpc_id" {
  type        = string
  description = "The ID of the VPC in which to place the web servers"
}

variable "bastion_security_group_id" {
  type        = string
  description = "The security group ID of the bastion host"
}

variable "alb_security_group_id" {
  type        = string
  description = "The security group ID of the ALB"
}

variable "rds_security_group_id" {
  type        = string
  description = "The security group ID of the RDS instance"
}

variable "rds_port" {
  type        = number
  default     = 3306
  description = "The port on which the RDS instance listens"
}

variable "http_port" {
  type        = string
  default     = 80
  description = "The port on which the web servers listen"
}

variable "http_target_group_arn" {
  type        = string
  description = "The ARN of the target group for the web servers"
}

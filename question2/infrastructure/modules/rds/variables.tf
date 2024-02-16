variable "rds_identifier" {
  type        = string
  description = "The name of the RDS instance	"
}

variable "rds_engine" {
  type        = string
  default     = "mysql"
  description = "The database engine to use for the RDS instance"
}

variable "rds_engine_version" {
  type        = string
  default     = "8.0"
  description = "The engine version to use for the RDS instance"
}

variable "rds_major_engine_version" {
  type        = string
  default     = "8.0"
  description = "The major engine version to use for the RDS instance"
}

variable "rds_db_family" {
  type        = string
  default     = "mysql8.0"
  description = "The family of the DB parameter group	"
}

variable "rds_instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "The instance class to use for the RDS instance"
}

variable "rds_multi_az" {
  type        = bool
  default     = false
  description = "Specifies if the RDS instance is multi-AZ"
}

variable "rds_allocated_storage" {
  type        = number
  default     = 5
  description = "The allocated storage in gigabytes"
}

variable "rds_db_name" {
  type        = string
  default     = ""
  description = "The DB name to create. If omitted, no database is created initially	"
}

variable "rds_db_username" {
  type        = string
  default     = ""
  description = "The username for the master DB user"
}

variable "rds_db_port" {
  type        = number
  default     = 3306
  description = "The port on which the DB accepts connections"
}

variable "rds_db_subnet_group_name" {
  type        = string
  description = "The name of the DB subnet group to associate with this RDS instance"
}

variable "rds_vpc_id" {
  type        = string
  description = "The VPC ID to create the RDS instance in"
}

variable "bastion_security_group_id" {
  type        = string
  default = ""
  description = "The security group ID of the bastion host"
}

variable "az_count" {
  type        = number
  default     = 2
  description = "The number of availabitity zones to use"
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  default     = ""
  description = "The name of the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "The list of public subnets CIDR blocks"
}

variable "private_subnets" {
  type        = list(string)
  description = "The list of private subnets CIDR blocks"
}

variable "database_subnets" {
  type        = list(string)
  description = "The list of database subnets CIDR blocks"
}

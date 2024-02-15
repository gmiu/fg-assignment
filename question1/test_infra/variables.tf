variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

variable "ubuntu22_count" {
  type    = number
  default = 1
}

variable "ubuntu20_count" {
  type    = number
  default = 1
}

variable "al2023_count" {
  type    = number
  default = 1
}

variable "al2_count" {
  type    = number
  default = 1
}

variable "debian12_count" {
  type    = number
  default = 1
}

variable "suse15_count" {
  type    = number
  default = 1
}

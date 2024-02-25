variable "bastion_name" {
  type        = string
  default     = "bastion"
  description = "The name of the bastion host"
}

variable "bastion_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type of the bastion host"
}

variable "bastion_ami_id" {
  type        = string
  default     = "ami-0440d3b780d96b29d" # Amazon Linux 2023 x86_64 HVM GP2
  description = "The AMI to use for the bastion host. Default is Amazon Linux 2023 x86_64 HVM GP2"
}

variable "bastion_key_name" {
  type        = string
  description = "The name of the key pair to use for the bastion host"
}

variable "bastion_subnet_id" {
  type        = string
  description = "The ID of the subnet to launch the bastion host in"
}

variable "bastion_vpc_id" {
  type        = string
  description = "The ID of the VPC to launch the bastion host in"
}

variable "ssh_allow_cidr_blocks" {
  # TODO: Change this to a list of strings
  type        = string
  description = "The CIDR blocks to allow SSH access from"
}

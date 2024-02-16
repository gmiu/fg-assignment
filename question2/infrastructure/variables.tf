variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region to deploy to"
}

variable "project_name" {
  type        = string
  default     = "fg-assignment"
  description = "The project name"
}

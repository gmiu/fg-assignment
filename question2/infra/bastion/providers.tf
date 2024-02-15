provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Project     = "fg-assignment"
      Environment = var.environment
    }
  }
}

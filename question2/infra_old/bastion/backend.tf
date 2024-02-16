terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }

  backend "s3" {
    region         = "us-east-1"
    bucket         = "197490477086-tech-gbrlm-tfstate"
    dynamodb_table = "197490477086-tech-gbrlm-tfstate-lock"
    key            = "fg-assignment/bastion.tfstate"
  }
}

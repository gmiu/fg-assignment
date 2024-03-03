terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }

  backend "s3" {}
}

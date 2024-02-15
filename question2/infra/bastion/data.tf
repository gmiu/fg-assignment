data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    region = var.aws_region
    bucket = "197490477086-tech-gbrlm-tfstate"
    key    = "fg-assignment/vpc.tfstate"
  }
}


# backend "s3" {
#     region         = "us-east-1"
#     bucket         = "197490477086-tech-gbrlm-tfstate"
#     dynamodb_table = "197490477086-tech-gbrlm-tfstate-lock"
#     key            = "fg-assignment/vpc.tfstate"
#   }
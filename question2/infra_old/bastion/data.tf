data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    region = var.aws_region
    bucket = "197490477086-tech-gbrlm-tfstate"
    key    = "fg-assignment/vpc.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    region = var.aws_region
    bucket = "197490477086-tech-gbrlm-tfstate"
    key    = "fg-assignment/vpc.tfstate"
  }
}

data "terraform_remote_state" "bastion" {
  backend = "s3"

  config = {
    region = var.aws_region
    bucket = "197490477086-tech-gbrlm-tfstate"
    key    = "fg-assignment/bastion.tfstate"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"

  config = {
    region = var.aws_region
    bucket = "197490477086-tech-gbrlm-tfstate"
    key    = "fg-assignment/alb.tfstate"
  }
}

data "terraform_remote_state" "rds" {
  backend = "s3"

  config = {
    region = var.aws_region
    bucket = "197490477086-tech-gbrlm-tfstate"
    key    = "fg-assignment/rds.tfstate"
  }
}


# mysql -u admin -h fg-db.cqzvgrcuqcdt.us-east-1.rds.amazonaws.com -P 3306 fgdb -p
locals {
  ami = {
    ubuntu22 = "ami-0c7217cdde317cfec" # ubuntu-jammy-22.04-amd64-server-20231207
    ubuntu20 = "ami-06aa3f7caf3a30282" # ubuntu-focal-20.04-amd64-server-20231025
    al2023   = "ami-0e731c8a588258d0d" # al2023-ami-2023.3.20240205.2-kernel-6.1-x86_64
    al2      = "ami-0cf10cdf9fcd62d37" # amzn2-ami-kernel-5.10-hvm-2.0.20240131.0-x86_64-gp2
    debian12 = "ami-058bd2d568351da34" # debian-12-amd64-20231013-1532
    suse15   = "ami-05efd9e66ddc3cf4b" # suse-sles-15-sp5-v20240129-hvm-ssd-x86_64
  }
}

module "ubuntu22" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  count = var.ubuntu22_count
  name  = "ubuntu22-${count.index}"

  instance_type          = "t2.micro"
  ami                    = local.ami.ubuntu22
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
}

module "ubuntu20" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  count = var.ubuntu20_count
  name  = "ubuntu20-${count.index}"

  instance_type          = "t2.micro"
  ami                    = local.ami.ubuntu20
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
}

module "al2023" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  count = var.al2023_count
  name  = "al2023-${count.index}"

  instance_type          = "t2.micro"
  ami                    = local.ami.al2023
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
}

module "al2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  count = var.al2_count
  name  = "al2-${count.index}"

  instance_type          = "t2.micro"
  ami                    = local.ami.al2
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
}

module "debian12" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  count = var.debian12_count
  name  = "debian12-${count.index}"

  instance_type          = "t2.micro"
  ami                    = local.ami.debian12
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
}

module "suse15" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  count = var.suse15_count
  name  = "bitnami-suse15-${count.index}"

  instance_type          = "t2.micro"
  ami                    = local.ami.suse15
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name = "fg-vpc"
  cidr = "10.0.0.0/24"

  azs = local.azs

  public_subnets   = ["10.0.0.0/27", "10.0.0.32/27"]    # DMZ public subnet
  private_subnets  = ["10.0.0.64/26", "10.0.0.128/26"]  # Front-end private subnet
  database_subnets = ["10.0.0.192/27", "10.0.0.224/27"] # Back-end private subnet

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true
}

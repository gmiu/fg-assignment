module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "fg-bastion"

  instance_type               = "t2.micro"
  ami                         = "ami-0e731c8a588258d0d"
  key_name                    = "simple-ec2-key" # to variables
  vpc_security_group_ids      = [module.bastion-sg.security_group_id]
  subnet_id                   = element(data.terraform_remote_state.vpc.outputs.public_subnet_ids, 0)
  associate_public_ip_address = true
}

module "bastion-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "fg-bastion-sg"
  description = "Security group for the bastion host"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "188.26.90.200/32"
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "All traffic"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

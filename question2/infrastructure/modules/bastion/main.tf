module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name = var.bastion_name

  instance_type               = var.bastion_instance_type
  ami                         = var.bastion_ami_id
  key_name                    = var.bastion_key_name
  vpc_security_group_ids      = [module.bastion_sg.security_group_id]
  subnet_id                   = var.bastion_subnet_id
  associate_public_ip_address = true
}

module "bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.bastion_name}-sg"
  description = "Security group for the ${var.bastion_name} bastion host"
  vpc_id      = var.bastion_vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = var.ssh_allow_cidr_blocks # TODO what to do when this is not passed, for now it will be required
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

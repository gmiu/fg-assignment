output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "bastion_sg_id" {
  value = module.bastion-sg.security_group_id
}

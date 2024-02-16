output "bastion_public_ip" {
  value       = module.bastion.public_ip
  description = "The public IP address of the Bastion host"
}

output "bastion_security_group_id" {
  value       = module.bastion_sg.security_group_id
  description = "The security group ID of the Bastion host"
}

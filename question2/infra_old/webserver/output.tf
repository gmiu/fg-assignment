output "webserver_sg_id" {
  value = module.webserver-sg.security_group_id
}

output "webserver_private_ip" {
  value = module.webserver[*].private_ip
}

output "webserver_id" {
  value = module.webserver[*].id
}


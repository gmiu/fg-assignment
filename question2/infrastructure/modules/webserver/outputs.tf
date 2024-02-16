output "webserver_private_ips" {
  value       = module.webserver[*].private_ip
  description = "The private IP addresses of the web servers"
}

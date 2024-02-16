<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.36.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fg_alb"></a> [fg\_alb](#module\_fg\_alb) | ./modules/alb | n/a |
| <a name="module_fg_bastion"></a> [fg\_bastion](#module\_fg\_bastion) | ./modules/bastion | n/a |
| <a name="module_fg_database"></a> [fg\_database](#module\_fg\_database) | ./modules/rds | n/a |
| <a name="module_fg_vpc"></a> [fg\_vpc](#module\_fg\_vpc) | ./modules/vpc | n/a |
| <a name="module_fg_webserver"></a> [fg\_webserver](#module\_fg\_webserver) | ./modules/webserver | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/5.36.0/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_enable_deletion_protection"></a> [alb\_enable\_deletion\_protection](#input\_alb\_enable\_deletion\_protection) | Enable deletion protection for the ALB | `bool` | `false` | no |
| <a name="input_alb_enable_tls"></a> [alb\_enable\_tls](#input\_alb\_enable\_tls) | Enable TLS for the ALB | `bool` | `false` | no |
| <a name="input_alb_r53_dns_name"></a> [alb\_r53\_dns\_name](#input\_alb\_r53\_dns\_name) | The DNS name to use for the ALB | `string` | `""` | no |
| <a name="input_alb_r53_dns_zone"></a> [alb\_r53\_dns\_zone](#input\_alb\_r53\_dns\_zone) | description | `string` | `""` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy to | `string` | n/a | yes |
| <a name="input_az_count"></a> [az\_count](#input\_az\_count) | The number of availability zones to deploy to | `number` | `2` | no |
| <a name="input_backend_webserver_port"></a> [backend\_webserver\_port](#input\_backend\_webserver\_port) | The port the webserver listens on | `number` | `8080` | no |
| <a name="input_bastion_key_name"></a> [bastion\_key\_name](#input\_bastion\_key\_name) | The name of the key pair to use for the bastion host | `string` | n/a | yes |
| <a name="input_bastion_ssh_allow_cidr_blocks"></a> [bastion\_ssh\_allow\_cidr\_blocks](#input\_bastion\_ssh\_allow\_cidr\_blocks) | The CIDR blocks to allow SSH access from | `string` | `"10.0.0.0/24"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `string` | `"fg-assignment"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The CIDR block for the VPC | `string` | `"10.0.0.0/24"` | no |
| <a name="input_webserver_key_name"></a> [webserver\_key\_name](#input\_webserver\_key\_name) | The name of the key pair to use for the webserver hosts | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fg_alb_dns_name"></a> [fg\_alb\_dns\_name](#output\_fg\_alb\_dns\_name) | The DNS name of the ALB |
| <a name="output_fg_bastion_public_ip"></a> [fg\_bastion\_public\_ip](#output\_fg\_bastion\_public\_ip) | The public IP of the bastion host |
| <a name="output_fg_database_address"></a> [fg\_database\_address](#output\_fg\_database\_address) | The address of the RDS MySQL DB |
| <a name="output_fg_database_endpoint"></a> [fg\_database\_endpoint](#output\_fg\_database\_endpoint) | The endpoint of the RDS MySQL DB |
| <a name="output_fg_database_master_user_secret_arn"></a> [fg\_database\_master\_user\_secret\_arn](#output\_fg\_database\_master\_user\_secret\_arn) | The ARN of the secret containing the master user credentials for the RDS MySQL DB |
| <a name="output_fg_dns_endpoint"></a> [fg\_dns\_endpoint](#output\_fg\_dns\_endpoint) | The DNS endpoint of the ALB |
| <a name="output_fg_webserver_private_ips"></a> [fg\_webserver\_private\_ips](#output\_fg\_webserver\_private\_ips) | The private IPs of the web servers |
<!-- END_TF_DOCS -->
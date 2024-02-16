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
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy to | `string` | `"us-east-1"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `string` | `"fg-assignment"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fg_alb_dns_name"></a> [fg\_alb\_dns\_name](#output\_fg\_alb\_dns\_name) | The DNS name of the ALB |
| <a name="output_fg_alb_target_group_http_arn"></a> [fg\_alb\_target\_group\_http\_arn](#output\_fg\_alb\_target\_group\_http\_arn) | The ARN of the target group for the HTTP listener |
| <a name="output_fg_bastion_public_ip"></a> [fg\_bastion\_public\_ip](#output\_fg\_bastion\_public\_ip) | The public IP of the bastion host |
| <a name="output_fg_database_address"></a> [fg\_database\_address](#output\_fg\_database\_address) | The address of the RDS MySQL DB |
| <a name="output_fg_database_endpoint"></a> [fg\_database\_endpoint](#output\_fg\_database\_endpoint) | The endpoint of the RDS MySQL DB |
| <a name="output_fg_database_master_user_secret_arn"></a> [fg\_database\_master\_user\_secret\_arn](#output\_fg\_database\_master\_user\_secret\_arn) | The ARN of the secret containing the master user credentials for the RDS MySQL DB |
| <a name="output_fg_webserver_private_ips"></a> [fg\_webserver\_private\_ips](#output\_fg\_webserver\_private\_ips) | The private IPs of the web servers |
<!-- END_TF_DOCS -->
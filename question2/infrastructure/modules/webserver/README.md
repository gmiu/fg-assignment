<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.66 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_webserver"></a> [webserver](#module\_webserver) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_webserver_sg"></a> [webserver\_sg](#module\_webserver\_sg) | terraform-aws-modules/security-group/aws | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_lb_target_group_attachment.webserver_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_security_group_id"></a> [alb\_security\_group\_id](#input\_alb\_security\_group\_id) | The security group ID of the ALB | `string` | n/a | yes |
| <a name="input_bastion_security_group_id"></a> [bastion\_security\_group\_id](#input\_bastion\_security\_group\_id) | The security group ID of the bastion host | `string` | n/a | yes |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The port on which the web servers listen | `string` | `80` | no |
| <a name="input_http_target_group_arn"></a> [http\_target\_group\_arn](#input\_http\_target\_group\_arn) | The ARN of the target group for the web servers | `string` | n/a | yes |
| <a name="input_rds_port"></a> [rds\_port](#input\_rds\_port) | The port on which the RDS instance listens | `number` | `3306` | no |
| <a name="input_rds_security_group_id"></a> [rds\_security\_group\_id](#input\_rds\_security\_group\_id) | The security group ID of the RDS instance | `string` | n/a | yes |
| <a name="input_webserver_ami_id"></a> [webserver\_ami\_id](#input\_webserver\_ami\_id) | The AMI to use for the web servers. Default is Amazon Linux 2023 x86\_64 HVM GP2 | `string` | `"ami-0e731c8a588258d0d"` | no |
| <a name="input_webserver_count"></a> [webserver\_count](#input\_webserver\_count) | The number of web servers to create | `number` | `2` | no |
| <a name="input_webserver_instance_type"></a> [webserver\_instance\_type](#input\_webserver\_instance\_type) | The instance type of the web servers | `string` | `"t2.micro"` | no |
| <a name="input_webserver_key_name"></a> [webserver\_key\_name](#input\_webserver\_key\_name) | The name of the key pair to use for the web servers | `string` | n/a | yes |
| <a name="input_webserver_name"></a> [webserver\_name](#input\_webserver\_name) | The name of the web servers | `string` | `""` | no |
| <a name="input_webserver_subnet_ids"></a> [webserver\_subnet\_ids](#input\_webserver\_subnet\_ids) | The IDs of the subnets in which to place the web servers | `list(string)` | n/a | yes |
| <a name="input_webserver_vpc_id"></a> [webserver\_vpc\_id](#input\_webserver\_vpc\_id) | The ID of the VPC in which to place the web servers | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_webserver_private_ips"></a> [webserver\_private\_ips](#output\_webserver\_private\_ips) | The private IP addresses of the web servers |
<!-- END_TF_DOCS -->
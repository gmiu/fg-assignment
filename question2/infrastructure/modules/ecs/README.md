<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | terraform-aws-modules/ecs/aws//modules/cluster | 5.9.1 |
| <a name="module_ecs_service"></a> [ecs\_service](#module\_ecs\_service) | terraform-aws-modules/ecs/aws//modules/service | 5.9.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_security_group_id"></a> [alb\_security\_group\_id](#input\_alb\_security\_group\_id) | The security group ID of the ALB | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the ECS cluster | `string` | n/a | yes |
| <a name="input_db_host"></a> [db\_host](#input\_db\_host) | The hostname of the database | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database | `string` | n/a | yes |
| <a name="input_db_pass"></a> [db\_pass](#input\_db\_pass) | The password to use to connect to the database | `string` | n/a | yes |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | The username to use to connect to the database | `string` | n/a | yes |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The port the service listens on | `number` | n/a | yes |
| <a name="input_http_target_group_arn"></a> [http\_target\_group\_arn](#input\_http\_target\_group\_arn) | The ARN of the HTTP target group | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the ECS cluster | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnet IDs to use for the ECS service | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.33 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | ~> 9.0 |
| <a name="module_alb_route53_alias"></a> [alb\_route53\_alias](#module\_alb\_route53\_alias) | ./modules/route53_alias | n/a |
| <a name="module_alb_tls_certificate"></a> [alb\_tls\_certificate](#module\_alb\_tls\_certificate) | ./modules/tls | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_certificate_arn"></a> [alb\_certificate\_arn](#input\_alb\_certificate\_arn) | The ARN of the certificate to use for HTTPS | `string` | `""` | no |
| <a name="input_alb_enable_deletion_protection"></a> [alb\_enable\_deletion\_protection](#input\_alb\_enable\_deletion\_protection) | If true, deletion of the ALB will be protected | `bool` | `false` | no |
| <a name="input_alb_enable_tls"></a> [alb\_enable\_tls](#input\_alb\_enable\_tls) | If true, the ALB will be configured with HTTPS on port 443.<br>If false, the ALB will be configured with HTTP on port 443 | `bool` | `false` | no |
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | The name of the ALB | `string` | n/a | yes |
| <a name="input_alb_subnet_ids"></a> [alb\_subnet\_ids](#input\_alb\_subnet\_ids) | The subnet IDs of the ALB | `list(string)` | n/a | yes |
| <a name="input_alb_vpc_id"></a> [alb\_vpc\_id](#input\_alb\_vpc\_id) | The VPC ID of the ALB | `string` | n/a | yes |
| <a name="input_backend_port"></a> [backend\_port](#input\_backend\_port) | The port of the backend service | `number` | `8080` | no |
| <a name="input_route53_record"></a> [route53\_record](#input\_route53\_record) | The Route53 record | `string` | `""` | no |
| <a name="input_route53_zone"></a> [route53\_zone](#input\_route53\_zone) | The Route53 zone name | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | The DNS name of the ALB |
| <a name="output_alb_security_group_id"></a> [alb\_security\_group\_id](#output\_alb\_security\_group\_id) | The ID of the security group for the ALB |
| <a name="output_alb_target_group_http_arn"></a> [alb\_target\_group\_http\_arn](#output\_alb\_target\_group\_http\_arn) | The ARN of the HTTP target group |
<!-- END_TF_DOCS -->
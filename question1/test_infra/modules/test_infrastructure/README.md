blabla

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_al2"></a> [al2](#module\_al2) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_al2023"></a> [al2023](#module\_al2023) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_debian12"></a> [debian12](#module\_debian12) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_suse15"></a> [suse15](#module\_suse15) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_ubuntu20"></a> [ubuntu20](#module\_ubuntu20) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_ubuntu22"></a> [ubuntu22](#module\_ubuntu22) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_al2023_count"></a> [al2023\_count](#input\_al2023\_count) | n/a | `number` | `1` | no |
| <a name="input_al2_count"></a> [al2\_count](#input\_al2\_count) | n/a | `number` | `1` | no |
| <a name="input_debian12_count"></a> [debian12\_count](#input\_debian12\_count) | n/a | `number` | `1` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_suse15_count"></a> [suse15\_count](#input\_suse15\_count) | n/a | `number` | `1` | no |
| <a name="input_ubuntu20_count"></a> [ubuntu20\_count](#input\_ubuntu20\_count) | n/a | `number` | `1` | no |
| <a name="input_ubuntu22_count"></a> [ubuntu22\_count](#input\_ubuntu22\_count) | n/a | `number` | `1` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
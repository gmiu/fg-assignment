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
| <a name="module_test_infrastructure"></a> [test\_infrastructure](#module\_test\_infrastructure) | ./modules/test_infrastructure | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_al2023_count"></a> [al2023\_count](#input\_al2023\_count) | n/a | `number` | `1` | no |
| <a name="input_al2_count"></a> [al2\_count](#input\_al2\_count) | n/a | `number` | `1` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_debian12_count"></a> [debian12\_count](#input\_debian12\_count) | n/a | `number` | `1` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_suse15_count"></a> [suse15\_count](#input\_suse15\_count) | n/a | `number` | `1` | no |
| <a name="input_ubuntu20_count"></a> [ubuntu20\_count](#input\_ubuntu20\_count) | n/a | `number` | `1` | no |
| <a name="input_ubuntu22_count"></a> [ubuntu22\_count](#input\_ubuntu22\_count) | n/a | `number` | `1` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
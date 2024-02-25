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
| <a name="module_bastion"></a> [bastion](#module\_bastion) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_bastion_sg"></a> [bastion\_sg](#module\_bastion\_sg) | terraform-aws-modules/security-group/aws | ~> 5.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_ami_id"></a> [bastion\_ami\_id](#input\_bastion\_ami\_id) | The AMI to use for the bastion host. Default is Amazon Linux 2023 x86\_64 HVM GP2 | `string` | `"ami-0440d3b780d96b29d"` | no |
| <a name="input_bastion_instance_type"></a> [bastion\_instance\_type](#input\_bastion\_instance\_type) | The instance type of the bastion host | `string` | `"t2.micro"` | no |
| <a name="input_bastion_key_name"></a> [bastion\_key\_name](#input\_bastion\_key\_name) | The name of the key pair to use for the bastion host | `string` | n/a | yes |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | The name of the bastion host | `string` | `"bastion"` | no |
| <a name="input_bastion_subnet_id"></a> [bastion\_subnet\_id](#input\_bastion\_subnet\_id) | The ID of the subnet to launch the bastion host in | `string` | n/a | yes |
| <a name="input_bastion_vpc_id"></a> [bastion\_vpc\_id](#input\_bastion\_vpc\_id) | The ID of the VPC to launch the bastion host in | `string` | n/a | yes |
| <a name="input_ssh_allow_cidr_blocks"></a> [ssh\_allow\_cidr\_blocks](#input\_ssh\_allow\_cidr\_blocks) | The CIDR blocks to allow SSH access from | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_public_ip"></a> [bastion\_public\_ip](#output\_bastion\_public\_ip) | The public IP address of the Bastion host |
| <a name="output_bastion_security_group_id"></a> [bastion\_security\_group\_id](#output\_bastion\_security\_group\_id) | The security group ID of the Bastion host |
<!-- END_TF_DOCS -->
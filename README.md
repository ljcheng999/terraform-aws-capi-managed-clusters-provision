<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.amazon_eks_ingress_elb_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.capa_cluster_service_account_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.capa_nodes_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.capa_nodes_karpender_controller_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.capa_cluster_service_account_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.capa_cluster_service_account_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id_allow_assume_self"></a> [aws\_account\_id\_allow\_assume\_self](#input\_aws\_account\_id\_allow\_assume\_self) | This is the managed aws account id, it will be used to assume by manager aws account | `string` | `""` | no |
| <a name="input_aws_account_id_upstream"></a> [aws\_account\_id\_upstream](#input\_aws\_account\_id\_upstream) | The upstream/manager aws account id | `string` | `""` | no |
| <a name="input_capa_ingress_elb_policy_name"></a> [capa\_ingress\_elb\_policy\_name](#input\_capa\_ingress\_elb\_policy\_name) | The policy that will be able to create aws load balancer controller | `string` | `"capa-nodes-elb-policy"` | no |
| <a name="input_capa_nodes_assume_policy"></a> [capa\_nodes\_assume\_policy](#input\_capa\_nodes\_assume\_policy) | The policy that will be able to assume by multiple resources | `string` | `"capa-nodes-assume-policy"` | no |
| <a name="input_capa_nodes_karpenter_controller_policy_name"></a> [capa\_nodes\_karpenter\_controller\_policy\_name](#input\_capa\_nodes\_karpenter\_controller\_policy\_name) | The policy that will be able to create karpenter | `string` | `"capa-nodes-karpenter-controller-policy"` | no |
| <a name="input_custom_statement"></a> [custom\_statement](#input\_custom\_statement) | n/a | `list` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_capa_capi_irsa_aws_iam_role_name"></a> [capa\_capi\_irsa\_aws\_iam\_role\_name](#output\_capa\_capi\_irsa\_aws\_iam\_role\_name) | n/a |
| <a name="output_capa_capi_irsa_aws_iam_role_policy_name"></a> [capa\_capi\_irsa\_aws\_iam\_role\_policy\_name](#output\_capa\_capi\_irsa\_aws\_iam\_role\_policy\_name) | n/a |
<!-- END_TF_DOCS -->

output "capa_capi_irsa_aws_iam_role_name" {
  value = aws_iam_role.capa_cluster_service_account_role.name
}
output "capa_capi_irsa_aws_iam_role_policy_name" {
  value = aws_iam_role.capa_cluster_service_account_policy.name
}

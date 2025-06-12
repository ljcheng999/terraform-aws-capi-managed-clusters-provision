
provider "aws" {
  region = var.region

  # assume_role {
  #   role_arn = var.assume_role_str
  # }
}

module "capi_managed_clusters_provision" {
  # source = "../../modules/terraform-aws-capi-managed-clusters-provision"
  source  = "ljcheng999/capi-managed-clusters-provision/aws"
  version = "1.0.0"


  aws_account_id_allow_assume_self                          = var.aws_account_id_allow_assume_self
  federated_arns_assume_role_from_dm_core                   = local.federated_arns_assume_role_from_dm_core
  federated_statements_allow_dm_core_capi_clusters_for_irsa = local.federated_statements_allow_dm_core_capi_clusters_for_irsa

  tags = merge(
    local.tags,
    var.addition_tags
  )
}

output "capi_managed_clusters_provision" {
  value = module.capi_managed_clusters_provision
}

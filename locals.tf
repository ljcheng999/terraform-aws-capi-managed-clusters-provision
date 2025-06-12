locals {
  tags = {
    organization    = "engineer"
    group           = "engineer"
    team            = "engineer"
    stack           = "capi-managed-clusters-provision"
    email           = "example.com"
    application     = "downstream-provision"
    automation_tool = "terraform"
    automation_path = "services/capi-managed-clusters-provision"
  }

  aws_region = var.region == "" ? var.aws_region : var.region

  federated_arns_assume_role_from_dm_core = [for item in var.cm_oidc_providers : item.arn]
  federated_statements_allow_dm_core_capi_clusters_for_irsa = {
    for item in var.cm_oidc_providers : "${replace(item.url, "https://", "")}:aud" => "sts.amazonaws.com"
  }
}
 

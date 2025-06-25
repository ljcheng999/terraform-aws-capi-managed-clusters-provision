variable "aws_account_id_allow_assume_self" {
  type    = string
  default = ""
}

variable "tags" {
  default = {}
}


# variable "federated_arns_assume_role_from_dm_core" {
#   default = []
# }
# variable "federated_statements_allow_dm_core_capi_clusters_for_irsa" {
#   default = []
# }

variable "aws_account_id_upstream" {
  type    = string
  default = ""
}

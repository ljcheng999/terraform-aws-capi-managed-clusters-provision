variable "aws_account_id_allow_assume_self" {
  type    = string
  default = ""
}

variable "tags" {
  default = {}
}

variable "aws_account_id_upstream" {
  type    = string
  default = ""
}

variable "capa_ingress_elb_policy_name" {
  type    = string
  default = "capa-nodes-elb-policy"
}
variable "capa_nodes_assume_policy" {
  type    = string
  default = "capa-nodes-assume-policy"
}
variable "capa_nodes_karpenter_controller_policy_name" {
  type    = string
  default = "capa-nodes-karpenter-controller-policy"
}

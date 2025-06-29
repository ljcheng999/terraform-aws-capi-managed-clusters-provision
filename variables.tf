variable "aws_account_id_allow_assume_self" {
  description = "This is the managed aws account id, it will be used to assume by manager aws account"
  type        = string
  default     = ""
}

variable "tags" {
  default = {}
}

variable "aws_account_id_upstream" {
  description = "The upstream/manager aws account id"
  type        = string
  default     = ""
}

variable "capa_ingress_elb_policy_name" {
  description = "The policy that will be able to create aws load balancer controller"
  type        = string
  default     = "capa-nodes-elb-policy"
}
variable "capa_nodes_assume_policy" {
  description = "The policy that will be able to assume by multiple resources"
  type        = string
  default     = "capa-nodes-assume-policy"
}
variable "capa_nodes_karpenter_controller_policy_name" {
  description = "The policy that will be able to create karpenter"
  type        = string
  default     = "capa-nodes-karpenter-controller-policy"
}

variable "custom_statement" {
  default = []
}

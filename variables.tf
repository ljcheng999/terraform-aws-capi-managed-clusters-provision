variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "region" {
  type    = string
  default = ""
}

variable "assume_role_str" {
  type    = string
  default = ""
}

variable "addition_tags" {
  type    = map(any)
  default = {}
}

variable "aws_account_id_allow_assume_self" {
  type    = string
  default = ""
}

variable "cm_oidc_providers" {
  type    = list(any)
  default = []
}

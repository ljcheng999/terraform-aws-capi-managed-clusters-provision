


addition_tags = {}

region = "us-east-1"

# assume_role_str = ""

aws_account_id_allow_assume_self = "022985595394" # itself
cm_oidc_providers = [
  {
    name = "capi-cm-poc",
    url  = "https://oidc.eks.us-east-1.amazonaws.com/id/01061DD7F74BF223EB411E422B0DDC66",
    arn  = "arn:aws:iam::339712760247:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/01061DD7F74BF223EB411E422B0DDC66",
  },
]

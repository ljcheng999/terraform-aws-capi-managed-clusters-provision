
resource "aws_iam_policy" "amazon_eks_ingress_alb_policy" {
  name        = var.capa_ingress_elb_policy_name
  description = "Policy for CAPI Cluster ELB policy"
  policy      = file("${path.module}/templates/aws/capa-elb-iam-policy.json")

  tags = merge(
    {
      "Name" : "${var.capa_ingress_elb_policy_name}"
    },
  )
}

resource "aws_iam_policy" "capa_nodes_assume_role_policy" {
  name        = var.capa_nodes_assume_policy
  description = "Policy for CAPA node assume policy"
  policy      = file("${path.module}/templates/aws/capa-nodes-assume-role-policy.json")

  tags = merge(
    {
      "Name" : "${var.capa_nodes_assume_policy}"
    },
  )
}

resource "aws_iam_policy" "capa_nodes_karpender_controller_policy" {
  name        = var.capa_nodes_karpenter_controller_policy_name
  description = "Policy for CAPA node karpender controller policy"
  policy      = file("${path.module}/templates/aws/capa-nodes-karpender-controller-policy.json")

  tags = merge(
    {
      "Name" : "${var.capa_nodes_karpenter_controller_policy_name}"
    },
  )
}

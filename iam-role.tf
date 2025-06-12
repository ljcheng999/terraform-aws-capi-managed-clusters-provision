resource "aws_iam_role" "capi_assume_role" {
  name = "${var.aws_account_id_allow_assume_self}-cluster-service-account"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLocalCapaNodesAssume",
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Principal = {
          AWS = [
            "arn:aws:iam::${var.aws_account_id_allow_assume_self}:root"
          ]
          Service = "ec2.amazonaws.com"
        },
        Condition = {
          "ForAllValues:StringLike" : {
            "aws:PrincipalArn" : [
              "arn:aws:sts::${var.aws_account_id_allow_assume_self}:assumed-role/capa*",
              "arn:aws:iam::${var.aws_account_id_allow_assume_self}:role/capa*"
            ]
          }
        },
      },
      {
        Sid    = "AllowDmCoreCapiClustersForIRSA",
        Action = "sts:AssumeRoleWithWebIdentity",
        Effect = "Allow",
        Principal = {
          Federated = var.federated_arns_assume_role_from_dm_core
        },
        Condition = {
          "StringEquals" : var.federated_statements_allow_dm_core_capi_clusters_for_irsa
        }
      },
    ]
  })

  tags = merge(
    {
      "Name" : "${var.aws_account_id_allow_assume_self}-capa-assume-role"
    },
    var.tags,
  )
}

resource "aws_iam_role_policy_attachment" "capi_assume_role_policy_attachment" {
  role       = aws_iam_role.capi_assume_role.name
  policy_arn = aws_iam_policy.capi_assume_role_policy.arn
}

resource "aws_iam_policy" "capi_assume_role_policy" {
  name        = "${var.aws_account_id_allow_assume_self}-cluster-service-account-policy"
  description = "${var.aws_account_id_allow_assume_self}-cluster-service-account-policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:ModifyVpcAttribute",
          "ec2:DescribeVpcAttribute",
          "ec2:DescribeNatGateways",
          "ec2:DescribeAvailabilityZones",
          "ec2:CreateVpc",
          "ec2:CreateSubnet",
          "ec2:CreateRouteTable",
          "ec2:CreateRoute",
          "ec2:CreateInternetGateway",
          "ec2:AttachInternetGateway",
          "ec2:AssociateVpcCidrBlock",
          "ec2:AssociateRouteTable",
          "ec2:CreateTags",
        ]
        Effect   = "Allow"
        Resource = "*"
        "Sid" : "CapaSaEc2"
      },
      {
        Action = [
          "iam:TagRole",
          "iam:RemoveRoleFromInstanceProfile",
          "iam:PassRole",
          "iam:ListAttachedRolePolicies",
          "iam:GetRole",
          "iam:GetPolicy",
          "iam:DetachRolePolicy",
          "iam:DeleteRole",
          "iam:DeleteInstanceProfile",
          "iam:CreateRole",
          "iam:CreatePolicy",
          "iam:CreateInstanceProfile",
          "iam:AttachRolePolicy",
          "iam:AddRoleToInstanceProfile"
        ]
        Effect   = "Allow"
        Resource = "*"
        "Sid" : "CapaSaIam"
      },
      {
        Action = [
          "eks:UpdateNodegroupVersion",
          "eks:UpdateNodegroupConfig",
          "eks:UpdateAddon",
          "eks:TagResource",
          "eks:ListNodegroups",
          "eks:ListAddons",
          "eks:DescribeUpdate",
          "eks:DescribeNodegroup",
          "eks:DescribeCluster",
          "eks:DescribeAddonVersions",
          "eks:DescribeAddonConfiguration",
          "eks:DescribeAddon",
          "eks:DeleteNodegroup",
          "eks:DeleteCluster",
          "eks:DeleteAddon",
          "eks:CreateNodegroup",
          "eks:CreateCluster",
          "eks:CreateAddon"
        ]
        Effect   = "Allow"
        Resource = "*"
        "Sid" : "CapaSaEks"
      },
      {
        Action = [
          "autoscaling:CreateOrUpdateTags"
        ]
        Effect   = "Allow"
        Resource = "*"
        "Sid" : "CapaSaEksAutoscaling"
      },
    ]
  })
}

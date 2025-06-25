
resource "aws_iam_role" "capa_cluster_service_account_role" {
  name = "${var.aws_account_id_allow_assume_self}-capa-assume-role"
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
        Sid    = "AllowDmCoreCapiClustersToAssume",
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = [
            "arn:aws:iam::${var.aws_account_id_upstream}:root",
            "arn:aws:iam::${var.aws_account_id_upstream}:role/controllers.cluster-api-provider-aws.sigs.k8s.io"
          ]
        },
      },
      # {
      #   Sid    = "AllowDmCoreCapiClustersForIRSA",
      #   Action = "sts:AssumeRoleWithWebIdentity",
      #   Effect = "Allow",
      #   Principal = {
      #     Federated = var.federated_arns_assume_role_from_dm_core
      #   },
      #   Condition = {
      #     "StringEquals" : var.federated_statements_allow_dm_core_capi_clusters_for_irsa
      #   }
      # },
    ]
  })

  tags = merge(
    {
      "Name" : "${var.aws_account_id_allow_assume_self}-capa-assume-role"
    },
    var.tags,
  )
}

resource "aws_iam_policy" "capa_cluster_service_account_policy" {
  name        = "${var.aws_account_id_allow_assume_self}-cluster-service-account-policy"
  description = "Policy for ${var.aws_account_id_allow_assume_self} CAPI Cluster SA policy"
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
          "ec2:DescribeVpcs",
          "ec2:DescribeSubnets",
          "ec2:DescribeRouteTables",
          "ec2:DescribeSecurityGroups",
          "ec2:AssignIpv6Addresses",
          "ec2:DescribeInstances",
          "ec2:DescribeImages",
          "ec2:DescribeRegions",
          "ec2:DescribeRouteTables",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVolumes",
          "ec2:CreateSecurityGroup",
          "ec2:CreateTags",
          "ec2:CreateVolume",
          "ec2:ModifyInstanceAttribute",
          "ec2:ModifyVolume",
          "ec2:AttachVolume",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:CreateRoute",
          "ec2:DeleteRoute",
          "ec2:DeleteSecurityGroup",
          "ec2:DeleteVolume",
          "ec2:DetachVolume",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:DescribeVpcs"
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
          "iam:AddRoleToInstanceProfile",
          "iam:CreateInstanceProfile",
          "iam:DeleteInstanceProfile",
          "iam:GetInstanceProfile",
          "iam:RemoveRoleFromInstanceProfile",
          "iam:GetRole",
          "iam:CreateRole",
          "iam:DeleteRole",
          "iam:AttachRolePolicy",
          "iam:PutRolePolicy",
          "iam:UpdateAssumeRolePolicy",
          "iam:AddRoleToInstanceProfile",
          "iam:ListInstanceProfilesForRole",
          "iam:PassRole",
          "iam:DetachRolePolicy",
          "iam:DeleteRolePolicy",
          "iam:GetRolePolicy",
          "iam:GetOpenIDConnectProvider",
          "iam:CreateOpenIDConnectProvider",
          "iam:DeleteOpenIDConnectProvider",
          "iam:TagOpenIDConnectProvider",
          "iam:ListAttachedRolePolicies",
          "iam:TagRole",
          "iam:UntagRole",
          "iam:GetPolicy",
          "iam:CreatePolicy",
          "iam:DeletePolicy",
          "iam:ListPolicyVersions",
          "iam:ListOpenIDConnectProviders"
        ]
        Effect   = "Allow"
        Resource = "*"
        "Sid" : "CapaSaIam"
      },
      {
        "Action" : [
          "eks:*"
        ],
        "Effect" : "Allow",
        "Resource" : "*",
        "Sid" : "CapaSaEks"
      },
      {
        "Action" : "autoscaling:CreateOrUpdateTags",
        "Effect" : "Allow",
        "Resource" : "*",
        "Sid" : "CapaSaTags"
      }
    ]
  })

  tags = merge(
    {
      "Name" : "${var.aws_account_id_allow_assume_self}-capa-assume-role"
    },
    var.tags,
  )
}


resource "aws_iam_role_policy_attachment" "capa_cluster_service_account_policy_attachment" {
  role       = aws_iam_role.capa_cluster_service_account_role.name
  policy_arn = aws_iam_policy.capa_cluster_service_account_policy.arn
}

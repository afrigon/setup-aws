module "foundation_role" {
  source     = "../modules/ci-role"
  depends_on = [aws_iam_openid_connect_provider.github]

  name         = "foundation"
  state_bucket = "terraform-xehos"
  github       = var.github
  permissions = [
    {
      actions = [
        "iam:ListOpenIDConnectProviders",
        "iam:GetRole",
        "iam:CreateRole",
        "iam:DeleteRole",
        "iam:GetRolePolicy",
        "iam:PutRolePolicy",
        "iam:DeleteRolePolicy",
        "iam:ListRolePolicies",
        "iam:ListAttachedRolePolicies",
        "iam:ListInstanceProfilesForRole",
        "route53:GetHostedZone",
        "route53:CreateHostedZone",
        "route53:DeleteHostedZone",
        "route53:ListResourceRecordSets",
        "route53:ChangeResourceRecordSets",
        "route53:GetChange",
        "route53:ListTagsForResource",
        "route53:ActivateKeySigningKey",
        "route53:CreateKeySigningKey",
        "route53:DeactivateKeySigningKey",
        "route53:DeleteKeySigningKey",
        "route53:DisableHostedZoneDNSSEC",
        "route53:EnableHostedZoneDNSSEC",
        "route53:GetDNSSEC",
        "route53domains:GetDomainDetail",
        "route53domains:UpdateDomainNameservers",
        "route53domains:GetOperationDetail",
        "route53domains:ListTagsForDomain",
        "kms:CreateKey",
        "kms:DescribeKey",
        "kms:GetPublicKey",
        "kms:Sign",
        "kms:CreateGrant",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion",
        "kms:GetKeyPolicy",
        "kms:PutKeyPolicy",
        "kms:GetKeyRotationStatus",
        "kms:ListResourceTags"
      ],
      resources = ["*"]
    },
    {
      actions   = ["iam:GetOpenIDConnectProvider"],
      resources = [aws_iam_openid_connect_provider.github.arn]
    }
  ]
}
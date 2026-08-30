locals {
  owner        = "afrigon"
  state_bucket = "terraform-xehos"
}

// Network Role

module "network_role" {
  source = "../modules/ci-role"

  name         = "network"
  state_bucket = local.state_bucket
  github = {
    owner      = local.owner
    repository = "network-setup"
  }
}

// Resume Role

module "resume_role" {
  source = "../modules/ci-role"

  name         = "resume"
  state_bucket = local.state_bucket
  github = {
    owner      = local.owner
    repository = "resume"
  }

  permissions = [
    {
      actions = [
        "s3:CreateBucket",
        "s3:DeleteBucket",
        "s3:ListBucket",
        "s3:GetBucketPolicy",
        "s3:PutBucketPolicy",
        "s3:DeleteBucketPolicy",
        "s3:GetEncryptionConfiguration",
        "s3:PutEncryptionConfiguration",
        "s3:GetBucketPublicAccessBlock",
        "s3:PutBucketPublicAccessBlock",
        "s3:GetBucketVersioning",
        "s3:GetBucketAcl",
        "s3:GetBucketCORS",
        "s3:GetBucketTagging",
        "s3:GetBucketLogging",
        "s3:GetBucketWebsite",
        "s3:GetAccelerateConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:GetReplicationConfiguration",
        "s3:GetBucketObjectLockConfiguration",
        "s3:GetBucketRequestPayment",
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "cloudfront:CreateDistribution",
        "cloudfront:UpdateDistribution",
        "cloudfront:DeleteDistribution",
        "cloudfront:GetDistribution",
        "cloudfront:TagResource",
        "cloudfront:ListTagsForResource",
        "cloudfront:CreateOriginAccessControl",
        "cloudfront:UpdateOriginAccessControl",
        "cloudfront:DeleteOriginAccessControl",
        "cloudfront:GetOriginAccessControl",
        "cloudfront:GetResponseHeadersPolicy",
        "cloudfront:ListResponseHeadersPolicies",
        "cloudfront:GetCachePolicy",
        "cloudfront:ListCachePolicies",
        "cloudfront:CreateInvalidation",
        "acm:RequestCertificate",
        "acm:DeleteCertificate",
        "acm:DescribeCertificate",
        "acm:ListTagsForCertificate",
        "acm:AddTagsToCertificate",
        "route53:ListHostedZones",
        "route53:ListHostedZonesByName",
        "route53:GetHostedZone",
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets",
        "route53:ListTagsForResource",
        "route53:GetChange"
      ]
      resources = ["*"]
    }
  ]
}

// Axr Role

module "axr_role" {
  source = "../modules/ci-role"

  name         = "axr"
  state_bucket = local.state_bucket
  github = {
    owner      = local.owner
    repository = "axr"
  }
  ref_pattern = "refs/heads/main"

  permissions = [
    {
      actions = [
        "s3:CreateBucket",
        "s3:DeleteBucket",
        "s3:ListBucket",
        "s3:GetBucketPolicy",
        "s3:PutBucketPolicy",
        "s3:DeleteBucketPolicy",
        "s3:GetEncryptionConfiguration",
        "s3:PutEncryptionConfiguration",
        "s3:GetBucketPublicAccessBlock",
        "s3:PutBucketPublicAccessBlock",
        "s3:GetBucketVersioning",
        "s3:GetBucketAcl",
        "s3:GetBucketCORS",
        "s3:GetBucketTagging",
        "s3:GetBucketLogging",
        "s3:GetBucketWebsite",
        "s3:GetAccelerateConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:GetReplicationConfiguration",
        "s3:GetBucketObjectLockConfiguration",
        "s3:GetBucketRequestPayment",
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "cloudfront:CreateDistribution",
        "cloudfront:UpdateDistribution",
        "cloudfront:DeleteDistribution",
        "cloudfront:GetDistribution",
        "cloudfront:TagResource",
        "cloudfront:ListTagsForResource",
        "cloudfront:CreateOriginAccessControl",
        "cloudfront:UpdateOriginAccessControl",
        "cloudfront:DeleteOriginAccessControl",
        "cloudfront:GetOriginAccessControl",
        "cloudfront:GetResponseHeadersPolicy",
        "cloudfront:ListResponseHeadersPolicies",
        "cloudfront:GetCachePolicy",
        "cloudfront:ListCachePolicies",
        "cloudfront:CreateInvalidation",
        "acm:RequestCertificate",
        "acm:DeleteCertificate",
        "acm:DescribeCertificate",
        "acm:ListTagsForCertificate",
        "acm:AddTagsToCertificate",
        "route53:ListHostedZones",
        "route53:ListHostedZonesByName",
        "route53:GetHostedZone",
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets",
        "route53:ListTagsForResource",
        "route53:GetChange"
      ]
      resources = ["*"]
    }
  ]
}

// Minecraft Role

module "minecraft_role" {
  source = "../modules/ci-role"

  name         = "minecraft"
  state_bucket = local.state_bucket
  github = {
    owner      = local.owner
    repository = "minecraft-server"
  }
}

// xlang Role

module "xlang_role" {
  source = "../modules/ci-role"

  name         = "xlang"
  state_bucket = local.state_bucket
  github = {
    owner      = local.owner
    repository = "x-lang"
  }

  permissions = [
    {
      actions = [
        "s3:CreateBucket",
        "s3:DeleteBucket",
        "s3:ListBucket",
        "s3:GetBucketPolicy",
        "s3:PutBucketPolicy",
        "s3:DeleteBucketPolicy",
        "s3:GetEncryptionConfiguration",
        "s3:PutEncryptionConfiguration",
        "s3:GetBucketPublicAccessBlock",
        "s3:PutBucketPublicAccessBlock",
        "s3:GetBucketVersioning",
        "s3:GetBucketAcl",
        "s3:GetBucketCORS",
        "s3:GetBucketTagging",
        "s3:GetBucketLogging",
        "s3:GetBucketWebsite",
        "s3:GetAccelerateConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:GetReplicationConfiguration",
        "s3:GetBucketObjectLockConfiguration",
        "s3:GetBucketRequestPayment",
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "cloudfront:CreateDistribution",
        "cloudfront:UpdateDistribution",
        "cloudfront:DeleteDistribution",
        "cloudfront:GetDistribution",
        "cloudfront:TagResource",
        "cloudfront:ListTagsForResource",
        "cloudfront:CreateOriginAccessControl",
        "cloudfront:UpdateOriginAccessControl",
        "cloudfront:DeleteOriginAccessControl",
        "cloudfront:GetOriginAccessControl",
        "cloudfront:GetResponseHeadersPolicy",
        "cloudfront:ListResponseHeadersPolicies",
        "cloudfront:GetCachePolicy",
        "cloudfront:ListCachePolicies",
        "cloudfront:CreateInvalidation",
        "acm:RequestCertificate",
        "acm:DeleteCertificate",
        "acm:DescribeCertificate",
        "acm:ListTagsForCertificate",
        "acm:AddTagsToCertificate",
        "route53:ListHostedZones",
        "route53:ListHostedZonesByName",
        "route53:GetHostedZone",
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets",
        "route53:ListTagsForResource",
        "route53:GetChange"
      ]
      resources = ["*"]
    }
  ]
}
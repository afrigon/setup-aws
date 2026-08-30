locals {
  xlang_domain  = "x-lang.dev"
  frigon_domain = "frigon.app"
  default_ttl   = 1800
}

# frigon.app dns

module "frigon_app_dns" {
  source = "../modules/dns"

  providers = {
    aws           = aws
    aws.us_east_1 = aws.us_east_1
  }

  domain           = local.frigon_domain
  update_registrar = true
  email_configuration = {
    mxa = "mx1.improvmx.com"
    mxb = "mx2.improvmx.com"
    spf = "v=spf1 include:spf.improvmx.com.org include:spf.improvmx.com ~all"
  }
  default_ttl = local.default_ttl
}

resource "aws_route53_record" "frigon_app_github_pages_challenge" {
  zone_id = module.frigon_app_dns.zone_id
  type    = "TXT"
  name    = "_github-pages-challenge-afrigon"
  records = ["d43a4033f036f81240a27196a84591"]
  ttl     = local.default_ttl
}

# xlang.dev dns

module "xlang_dev_dns" {
  source = "../modules/dns"

  providers = {
    aws           = aws
    aws.us_east_1 = aws.us_east_1
  }

  domain           = local.xlang_domain
  update_registrar = true
  default_ttl = local.default_ttl
}

resource "aws_route53_record" "xlang_dev_github_pages_challenge" {
  zone_id = module.xlang_dev_dns.zone_id
  type    = "TXT"
  name    = "_github-pages-challenge-afrigon"
  records = ["9b21170f5e3ee70d5ea419430e4e8b"]
  ttl     = local.default_ttl
}

// Wait for new NS records to propagate from Amazon Registrar through IANA
// to the TLD nameservers. EnableHostedZoneDNSSEC queries the parent and
// fails with HostedZonePartiallyDelegated until propagation completes.
resource "time_sleep" "dnssec_delegation" {
  depends_on = [
    module.xlang_dev_dns,
    module.frigon_app_dns
  ]
  create_duration = "300s"
}

// DNSSEC

module "frigon_app_dnssec" {
  source = "../modules/dnssec"

  providers = {
    aws.us_east_1 = aws.us_east_1
  }

  domain  = local.frigon_domain
  zone_id = module.frigon_app_dns.zone_id

  depends_on = [time_sleep.dnssec_delegation]
}

module "xlang_dev_dnssec" {
  source = "../modules/dnssec"

  providers = {
    aws.us_east_1 = aws.us_east_1
  }

  domain  = local.xlang_domain
  zone_id = module.xlang_dev_dns.zone_id

  depends_on = [time_sleep.dnssec_delegation]
}

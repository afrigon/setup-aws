# setup-aws

Terraform configuration for the foundation of a personal AWS account. It
provisions the remote state backend, the GitHub Actions OIDC provider and
per-repository CI roles, and the Route 53 hosted zones (with DNSSEC) for
personal domains.

The configuration is split in two roots:

- `bootstrap` — the state bucket, the GitHub OIDC provider, and the CI role
  that deploys the foundation. Applied locally.
- `foundation` — DNS zones, DNSSEC, and the CI roles assumed by other
  repositories. Applied by CI.

Shared building blocks live in `modules` (`dns`, `dnssec`, `ci-role`).

## Bootstrap

The state bucket cannot store the state of its own creation, so create
`s3://terraform-xehos` by hand once, then run the bootstrap with an
authenticated AWS CLI:

```sh
mise run bootstrap
```

## Deployment

The foundation deploys through GitHub Actions: pushing a tag runs
`terraform apply` in `foundation` under the CI role created by the
bootstrap.

Enabling DNSSEC on a domain requires a manual step at the registrar. After
an apply, run the `dnssec_*_associate_command` printed in the Terraform
outputs; run the matching disassociate command before destroying a zone.
